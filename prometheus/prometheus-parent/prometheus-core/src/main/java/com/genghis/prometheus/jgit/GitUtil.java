package com.genghis.prometheus.jgit;

import org.apache.commons.lang.StringUtils;
import org.eclipse.jgit.api.AddCommand;
import org.eclipse.jgit.api.CheckoutCommand;
import org.eclipse.jgit.api.CommitCommand;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.diff.DiffEntry;
import org.eclipse.jgit.diff.RenameDetector;
import org.eclipse.jgit.lib.ObjectId;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.treewalk.TreeWalk;
import org.eclipse.jgit.treewalk.filter.PathFilterGroup;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GitUtil {

    private final static String GIT = ".git";

    /**
     * 将文件列表提交到git仓库中
     *
     * @param gitRoot git仓库目录
     * @param files   需要提交的文件列表
     * @param remark  备注
     * @return 返回本次提交的版本号
     * @throws Exception
     */
    public static String commitToGitRepository(String gitRoot, List<String> files, String remark)
            throws Exception {
        if (StringUtils.isNotBlank(gitRoot) && files != null && files.size() > 0) {

            File rootDir = new File(gitRoot);

            //初始化git仓库
            if (new File(gitRoot + File.separator + GIT).exists() == false) {
                Git.init().setDirectory(rootDir).call();
            }

            //打开git仓库
            Git git = Git.open(rootDir);
            //判断工作区与暂存区的文件内容是否有变更
            List<DiffEntry> diffEntries = git.diff()
                    .setPathFilter(PathFilterGroup.createFromStrings(files))
                    .setShowNameAndStatusOnly(true).call();
            if (diffEntries == null || diffEntries.size() == 0) {
                throw new Exception("提交的文件内容都没有被修改，不能提交");
            }
            //被修改过的文件
            List<String> updateFiles = new ArrayList<String>();
            DiffEntry.ChangeType changeType;
            for (DiffEntry entry : diffEntries) {
                changeType = entry.getChangeType();
                switch (changeType) {
                    case ADD:
                    case COPY:
                    case RENAME:
                    case MODIFY:
                        updateFiles.add(entry.getNewPath());
                        break;
                    case DELETE:
                        updateFiles.add(entry.getOldPath());
                        break;
                }
            }
            //将文件提交到git仓库中，并返回本次提交的版本号
            //1、将工作区的内容更新到暂存区
            AddCommand addCmd = git.add();
            for (String file : updateFiles) {
                addCmd.addFilepattern(file);
            }
            addCmd.call();
            //2、commit
            CommitCommand commitCmd = git.commit();
            for (String file : updateFiles) {
                commitCmd.setOnly(file);
            }
            RevCommit revCommit = commitCmd.setCommitter("yonge", "654166020@qq.com")
                    .setMessage(remark).call();
            return revCommit.getName();
        }
        return null;
    }

    /**
     * 回滚到指定版本的上一个版本
     *
     * @param gitRoot     git仓库目录
     * @param diffEntries 需要回滚的文件
     * @param revision    版本号
     * @param remark      备注
     * @return
     * @throws Exception
     */
    public static boolean rollBackPreRevision(String gitRoot, List<DiffEntry> diffEntries,
                                              String revision, String remark) throws Exception {

        if (diffEntries == null || diffEntries.size() == 0) {
            throw new Exception("没有需要回滚的文件");
        }

        Git git = Git.open(new File(gitRoot));

        List<String> files = new ArrayList<String>();

        //注意：下面的reset命令会将暂存区的内容恢复到指定（revesion）的状态，相当于取消add命令的操作
        /*Repository repository = git.getRepository();

        RevWalk walk = new RevWalk(repository);
        ObjectId objId = repository.resolve(revision);
        RevCommit revCommit = walk.parseCommit(objId);
        String preVision = revCommit.getParent(0).getName();
        ResetCommand resetCmd = git.reset();
        for (String file : files) {
            resetCmd.addPath(file);
        }
        resetCmd.setRef(preVision).call();
        repository.close();*/

        //取出需要回滚的文件，新增的文件不回滚
        for (DiffEntry diffEntry : diffEntries) {
            if (diffEntry.getChangeType() == DiffEntry.ChangeType.DELETE) {
                continue;
            } else {
                files.add(diffEntry.getNewPath());
            }
        }

        if (files.size() == 0) {
            throw new Exception("没有需要回滚的文件");
        }

        //checkout操作会丢失工作区的数据，暂存区和工作区的数据会恢复到指定（revision）的版本内容
        CheckoutCommand checkoutCmd = git.checkout();
        for (String file : files) {
            checkoutCmd.addPath(file);
        }
        //加了“^”表示指定版本的前一个版本，如果没有上一版本，在命令行中会报错，例如：error: pathspec '4.vm' did not match any file(s) known to git.
        checkoutCmd.setStartPoint(revision + "^");
        checkoutCmd.call();

        //重新提交一次
        CommitCommand commitCmd = git.commit();
        for (String file : files) {
            commitCmd.setOnly(file);
        }
        commitCmd.setCommitter("yonge", "654166020@qq.com").setMessage(remark).call();

        return true;
    }

    /**
     * 获取上一版本的变更记录，如果是新增的文件，不会显示，因为做回滚时不需要回滚新增的文件
     *
     * @param gitRoot  git仓库目录
     * @param revision 版本号
     * @return
     * @throws Exception
     */
    public static List<DiffEntry> rollBackFile(String gitRoot, String revision) throws Exception {

        Git git = Git.open(new File(gitRoot));
        Repository repository = git.getRepository();

        ObjectId objId = repository.resolve(revision);
        Iterable<RevCommit> allCommitsLater = git.log().add(objId).call();
        Iterator<RevCommit> iter = allCommitsLater.iterator();
        RevCommit commit = iter.next();
        TreeWalk tw = new TreeWalk(repository);
        tw.addTree(commit.getTree());
        commit = iter.next();
        if (commit != null) {
            tw.addTree(commit.getTree());
        } else {
            throw new Exception("当前库只有一个版本，不能获取变更记录");
        }

        tw.setRecursive(true);
        RenameDetector rd = new RenameDetector(repository);
        rd.addAll(DiffEntry.scan(tw));
        List<DiffEntry> diffEntries = rd.compute();
        if (diffEntries == null || diffEntries.size() == 0) {
            return diffEntries;
        }
        Iterator<DiffEntry> iterator = new ArrayList<DiffEntry>(diffEntries).iterator();
        DiffEntry diffEntry = null;
        while (iterator.hasNext()) {
            diffEntry = iterator.next();
            System.out.println("newPath:" + diffEntry.getNewPath() + "    oldPath:"
                    + diffEntry.getOldPath() + "   changeType:"
                    + diffEntry.getChangeType());
            if (diffEntry.getChangeType() == DiffEntry.ChangeType.DELETE) {
                iterator.remove();
            }
        }
        return diffEntries;
    }
}