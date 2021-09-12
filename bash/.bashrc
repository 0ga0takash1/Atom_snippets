export CXX='g++-9'
export XX='gcc-9'

########## AtCoder ##########
function accdir () {
	cd ~/AtCoder/;
	cp -a Contest/ ${1^^};
	atom ${1^^};
	cd ${1^^};
}
alias acd=accdir

function accnew () {
	c=${PWD##*/}
	acc new ${c};
	mv ${c} s;
}
alias acn=accnew

function accsubmit () {
	path=$PWD;
	cpp='.cpp';
	name=$1${cpp};
	cp ${name} s/$1/;
	cd s/$1;
	acc submit ${name};
	cd ${path};
}
alias acs=accsubmit

function accsubmit2 () {
	if [ $1 = "t" ]; then
        commandline='acs2 XX.cpp abcXXX a';
        echo ${commandline};
    else
    	path=$PWD;
    	cpp='.cpp';
    	name=$3${cpp};
		cd;
		cd AtCoder/;
    	cp practice/$1 ${2^^}/s/$3/${name};
    	cd ${2^^}/s/$3;
    	acc submit ${name};
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
	cd ${path};
}
alias act=acctest

function acctest2 () {
	if [ $1 = "t" ]; then
		commandline='act2 XX.cpp abcXXX a';
		echo ${commandline};
	else
  		path=$PWD;
   		cpp='.cpp';
   		name=$3${cpp};
   		cp $1 ~/AtCoder/${2^^}/s/$3/${name};
   		cd ~/AtCoder/${2^^}/s/$3;
		g++-9 ${name};
    	oj t -d ./tests/;
    	cd ${path};
	fi
}
alias act2=acctest2

function acc_cp_a_use () {
	path=$PWD;
	cd ~/AtCoder/;
	cp Contest/a.cpp practice/;
	cp Contest/useful_func.cpp practice/;
	cd ${path};
}
alias acau=acc_cp_a_use

function acc_cp () {
	if [ $1 = "t" ]; then
        commandline='acp a XXX_XXX';
        echo ${commandline};
    else
        cpp='.cpp';
		c=${PWD##*/}
        name=${c}${1^^}"_"$2${cpp};
		cd ~/AtCoder/;
		cp ${c}/$1${cpp} practice/${name};
		cd practice/;
	fi
}
alias acp=acc_cp

function acc_mv () {
	if [ $1 = "t" ]; then
        commandline='rename: acmv abcXXX a XXX_XXX';
        echo ${commandline};
		commandline='remove: acmv ABCXXXA_XXX_XXX';
        echo ${commandline};
    else
		if [ -z $2 ]; then
  			mv $1 soloved/
            mv $1${cpp} soloved/
		else
			# check soloved
			read -p "soloved? (y/N): " soloved
			case "${soloved}" in 
				[yY]*) soloved=1;;
					*) soloved=0;;
			esac
			# prog
    		cpp='.cpp';
			name=${1^^}${2^^}"_"$3;
			if [ ${soloved} -eq 0 ]; then
        		mv $3 ${name}
				mv $3${cpp} ${name}${cpp}
			else
				mv $3 soloved/${name}
            	mv $3${cpp} soloved/${name}${cpp}
			fi			
		fi
	fi
}
alias acmv=acc_mv
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
    cd ${path};
}

alias vibash="vi ~/.bashrc"
alias codebash="code ~/.bashrc"
alias runbash="source ~/.bashrc"

function cp_bashrc () {
	cd;
	cp .bashrc Hakidame/bash/;
	cd Hakidame/bash;
	code .bashrc;
}
alias codebash2=cp_bashrc

function git_push_bashrc () {
	path=$PWD;
	cd ~/Hakidame/;
	git add --all;
	git commit -a -m "bashrc"
	git push origin master;
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
	$1 $2;
	cd $2;
}
alias edi=boot_edi_and_cd