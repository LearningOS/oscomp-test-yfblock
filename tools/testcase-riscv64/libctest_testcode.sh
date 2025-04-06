echo START libctest-glibc
echo START libctest-musl
./run-static.sh
./run-dynamic.sh
echo END libctest-glibc
echo END libctest-musl