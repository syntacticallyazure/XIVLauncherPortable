set shell := ["powershell.exe", "-c"]

# scoop install dotnet10-sdk dotnet9-sdk just git;

default:
    just --list;

[working-directory: "./submodules/FFXIVQuickLauncher/src"]
build:
    -& "$(scoop prefix dotnet10-sdk)\\dotnet.exe" build -c Debug --disable-build-servers;
    echo "Executable should be at: $(Resolve-Path .\\XIVLauncher\\bin\\Debug)"

setup:
    git submodule update --init --recursive

clean:
    git clean -fdx;
    git submodule foreach --recursive 'git clean -fdx'

[working-directory: "./submodules/FFXIVQuickLauncher/src"]
run:
    # scoop reset dotnet9-sdk
    # ./XIVLauncher/bin/Release/XIVLauncher.exe
    & "$(scoop prefix dotnet9-sdk)\\dotnet.exe" ".\\XIVLauncher\\bin\\Debug\\XIVLauncher.dll"

    # submodules\FFXIVQuickLauncher\src\XIVLauncher\bin\Release\XIVLauncher.dll