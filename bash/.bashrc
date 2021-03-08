export CXX='g++-9'
export XX='gcc-9'

alias vibash="vi ~/.bashrc"
alias runbash="source ~/.bashrc"

########## AtCoder ##########
function accdir () {
	cd ~/AtCoder/;
	cp -a Contest/ $1;
	atom $1;
	cd $1;
}
alias acd=accdir

function accnew () {
	acc new $1;
	mv $1 s;
}
alias acn=accnew

function accsubmit () {
	path=$PWD;
	cpp='.cpp';
	name=$1${cpp};
	cp ${name} s/$1/;
	cd s/$1;
	acc submit ${name};
	cd;
	cd ${path};
}
alias acs=accsubmit

function accsubmit2 () {
	if [ $1 = "t" ]; then
        commandline='acs2 XX.cpp ABCXXX a';
        echo ${commandline};
    else
    	path=$PWD;
    	cpp='.cpp';
    	name=$3${cpp};
		cd;
		cd AtCoder/;
    	cp practice/$1 $2/s/$3/${name};
    	cd $2/s/$3;
    	acc submit ${name};
    	cd;
    	cd ${path};
	fi
}
alias acs2=accsubmit2

function acctest () {
	path=$PWD;
	cpp='.cpp';
	name=$1${cpp};
	cp ${name} s/$1/;
	cd s/$1;
	g++-9 ${name};
	oj t -d ./tests/;
	cd;
	cd ${path};
}
alias act=acctest

function acctest2 () {
	if [ $1 = "t" ]; then
		commandline='act2 XX.cpp ABCXXX a';
		echo ${commandline};
	else
  		path=$PWD;
   		cpp='.cpp';
   		name=$3${cpp};
   		cp $1 ~/AtCoder/$2/s/$3/${name};
   		cd ~/AtCoder/$2/s/$3;
		g++-9 ${name};
    	oj t -d ./tests/;
    	cd;
    	cd ${path};
	fi
}
alias act2=acctest2

function cp_a_use () {
	path=$PWD;
	cd ~/AtCoder/;
	cp Contest/a.cpp practice/;
	cp Contest/useful_func.cpp practice/;
	cd;
	cd ${path};
}

function acc_cp () {
	if [ $1 = "t" ]; then
        commandline='accp ABCXXX a XXX_XXX';
        echo ${commandline};
    else
		path=$PWD;
        cpp='.cpp';
        name=$1${2^^}"_"$3${cpp};
		cd ~/AtCoder/;
		cp $1/$2${cpp} practice/${name};
		cd practice/;
	fi
}
########## AtCoder ##########

function git_add_commit_push () {
	git add --all;
	git commit -a -m "$1";
	git push origin master;
}

function gitpush_atomsnippets () {
	path=$PWD;
	cd;
	cp .atom/snippets.cson Hakidame/snippets/atom/;
	cd Hakidame/;
	git add --all;
	git commit -a -m "atom snippets";
	git push origin master;
	cd;
	cd ${path};
}
alias atoms=gitpush_atomsnippets

function gitpush_codesnippets () {
    path=$PWD;
    cd;
    cp ~/.config/Code/User/snippets/cpp.json Hakidame/snippets/code/;
    cd Hakidame/;
    git add --all;
    git commit -a -m "code snippets";
    git push origin master;
    cd;
    cd ${path};
}

function cp_bashrc () {
	cd;
	cp .bashrc Hakidame/bash/;
	cd Hakidame/bash;
	code .bashrc;
}
alias vibash2=cp_bashrc

function git_push_bashrc () {
	path=$PWD;
	cd ~/Hakidame/;
	git add --all;
	git commit -a -m "bashrc"
	git push origin master;
	cd;
	cd ${path};
}
alias pushbash=git_push_bashrc

function atom_cd () {
	if [ $1 = "t" ]; then
		commandline='atom2 XX/XX/ XX.txt';
		echo ${commandline};
	else
		cd;
		cd $1;
		atom $2;
	fi
}
alias atom2=atom_cd

function boot_edi_and_cd () {
	cd;
	$1 $2;
	cd $2;
}
alias edi=boot_edi_and_cd