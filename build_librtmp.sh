#!/bin/bash
NDK=$HOME/Library/Android/sdk/ndk-bundle
$NDK/ndk-build NDK_APPLICATION_MK=./jni/Application.mk NDK_PROJECT_PATH=./
