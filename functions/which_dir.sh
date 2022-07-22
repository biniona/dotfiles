function which_dir
{
    exe=$1
    which_exe=$(which $exe)
    cand_dir=${which_exe%/*}
    if [[ $cand_dir = /* ]]
    then echo $cand_dir
    else echo $which_exe
    fi
}