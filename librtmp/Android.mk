LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# 编译模块输出的名称
LOCAL_MODULE := rtmp

# 编译所需的头文件路径
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/
#$(LOCAL_PATH)/../openssl/include/ #链接openssl库

# 编译所需的源文件路径
LOCAL_SRC_FILES := \
	amf.c       \
	log.c       \
    parseurl.c  \
    rtmp.c      \
    hashswf.c

# 编译时候需要链接的动态库库存在静态库形式，将会链接到对应的静态库而不是动态库
# LOCAL_FORCE_STATIC_EXECUTABLE := true

# 添加编译配置选项，一些常用编译配置：
# -fPIC:编译位置无关的代码，一般用于编译动态库
# -02:编译优化程度
# -lxxx:链接名为libxxx库
# -I添加编译器搜索-l指定的库文件的搜索
# -D:加入宏定义NO_CRYPTO，不使用加密
LOCAL_CFLAGS += -DRTMPDUMP_VERSION=v2.4 -DNO_CRYPTO -Wall -fPIC -O2 
#LOCAL_CFLAGS += -I$(LOCAL_PATH)/../openssl -lssl -lcrypto #可选添加openssl支持，需去除-DNO_CRYPTO

# 添加编译时需要链接器链接的那些存在于NDK目录下的其它库，所链接库的以“-lxxx”格式命名，如：-lz 表示编译时会加载libz.so库
LOCAL_LDLIBS += -lz

# include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)

