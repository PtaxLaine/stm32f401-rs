@setlocal
@echo off

mkdir tmp
cd tmp
svd2rust -i ..\svd\STM32F401.svd
copy device.x ..\device.x
copy lib.rs ..\src\lib.rs
copy build.rs ..\build.rs
cd ..
rmdir /S /Q tmp

cargo fmt
cargo xbuild --target thumbv7em-none-eabihf

endlocal
