echo '#### OS COMP TEST GROUP START libctest-glibc ####'
echo '#### OS COMP TEST GROUP START libctest-musl ####'
./run-static.sh
./run-dynamic.sh
echo '#### OS COMP TEST GROUP END libctest-musl ####'
echo '#### OS COMP TEST GROUP END libctest-glibc ####'