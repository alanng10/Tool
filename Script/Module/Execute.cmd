@echo off

set ClassFold=..\Class\Out\Class

pushd %ClassFold%
Tool.Tool-0.00.00
echo Status: %errorlevel%
popd