<p align="center">
<img src="https://github.com/epfl-lasa/wiki/blob/master/img/git.png" width="300" />
</p>

:trophy: If you are familiar with Git and it is already set up on your computer, you can directly head over to [Git Best Practices](https://github.com/epfl-lasa/wiki/wiki/Git-Best-Practices).

:arrows_counterclockwise: If you are familiar with Git but need a little help setting it up on your computer, go to the 
[Setup instructions](#setting-up-git-on-your-computer). 

:hatching_chick: If you are a Git newcomer, take your time and go through the [introduction](#a-brief-introduction) below to learn about Git 
before you use it. It might also be helpful to go through one or two tutorials that you can easily find online (e.g. **[this](https://try.github.io/) very useful interactive tutorial** on GitHub). The Git workflow may seem overwhelming at the beginning, but Google is always there for you and in very short time, you'll understand the power of Git and how to use it efficiently.

Independent of your expertise, check [this](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet) 
cheatsheet to work with Git efficiently.

## A brief introduction
Git is the de facto standard **version control system** (VCS). The use of such a 
version control system is required in software development because changes in program source code (and 
and other set of files) can be **tracked** over time and any older version of the code can be restored 
by **reverting** undesired changes. Moreover, it allows for parallel development and coordination among 
all contributors. Git is open source and a so-called *distributed* VCS because a full copy of the code is 
**locally** present in all the developer's computers, meaning that local changes do not instantly affect the 
code stored in the remote repository in a server.

For more information, please visit
- [this](https://www.freecodecamp.org/news/what-is-git-and-how-to-use-it-c341b049ae61/) nice introduction including a short 
tutorial,
- the [Atlassian tutorials](https://www.atlassian.com/git/tutorials/what-is-git) page,
- or the official [Git](https://git-scm.com/book/en/v2/Getting-Started-What-is-Git%3F) page.

### The three states
Git has three main states that a file can reside in:
- **modified**: you have changed the file locally, the online databased is unchanged
- **staged**: you like your changes and marked them to be included in your next commit
- **commited**: you 'commit' to your current version of the source files and want them safely stored in your local database.

### Branches
Branches are nothing else but pointers to the latest commit in the Git repository. In other words, they represent 
the timeline of your commits. Branches are useful because they support multiple parallel developments. Several people can 
start from the same code base and their branches will diverge from there. At any time, changes from one branch 
can be **merged** into another branch.

:warning:**CAREFUL**:warning:: By default, Git commits into the **master** branch. This can be dangerous because changes should only be commited 
to the master branch if they don't break the code and if the code owner accepts the changes (more on that [here](https://github.com/epfl-lasa/wiki/wiki/Git-Best-Practices#eyeglasses-code-review-and-pull-requests)). 
Therefore, work on your own branch if you want to make sure that you don't create conflicts on the remote repository (more 
on that [here](https://github.com/epfl-lasa/wiki/wiki/Git-Best-Practices#cactus-feature-branch-workflow-and-branch-naming)).

### Basic workflow
The basic Git workflow goes something like this:
1. `git clone` a desired repository
2. `git checkout -b feature/mybranch` to create (`-b`) and change to (`checkout`) your new branch called *feature/mybranch*
3. Modify your files
4. `git status` to see the status of your local database
5. `git stage` to stage your local changes
6. `git commit` to commit your staged files
7. `git push` to push your commit to the remote repository
8. Repeat steps 3 to 7 until you have finished implementing your new feature
9. Create a [pull request](https://github.com/epfl-lasa/wiki/wiki/Git-Best-Practices#eyeglasses-code-review-and-pull-requests) to merge your branch into *master* branch

If somebody else pushed a new version a branch to the remote repository, use `git pull` to download these changes to 
your local repository.

### Conclusion
This introduction alone will not be sufficient for you to master Git rightaway. Before you start, try to understand the 
different commands presented in the basic workflow above. Again, there are many resources online and you are not the 
only one struggling with Git. You will learn the rest as you go and use Git regularly.

## Setting up Git on your computer
Install Git on your computer with
```bash
sudo apt update
sudo apt install git
```
Once you have created your GitHub account too, set your username with
```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@examlpe.ch
```
### Use SSH for Git
Using SSH for working with Git is strongly suggested 
(see [About SSH](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/about-ssh)). Follow the 
steps below to create your own SSH key and 
add it to your GitHub account.
1. [Generate a new SSH key and add it to the ssh-agent](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
2. [Add a new SSH key to your GitHub account](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

### VCS integration in your code editor
Most of the commonly used code editors and IDEs (more on that HERE) such as CLion, Visual Studio Code and Sublime come with integrated 
version source control. While VCS is fully integrated in CLion and Visual Studio Code, the VCS extension for Sublime 
can be installed seperately and is called *Sublime Merge*. These tools are very helpful and offer a graphical user 
interface for Git with extended functionalities.
