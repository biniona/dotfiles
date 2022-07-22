# find_ipd directory pattern
# function to ignore permission denied errors in find commands 

function find_ipd
{
    start_dir=${1:?'must specify start directory'}
    find_pattern=${2:?'must specify pattern'}
    awk_pattern='$0 !~ /[pP]ermission/ && $0 !~ /[dD]enied/ && $0 !~ /not permitted/'
    find $start_dir -name "$find_pattern" 2>&1 | awk "$awk_pattern"
}
