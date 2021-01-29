;---------boot和loader--------------
;实现boot 和 loader 不在同一个sector中；
;给boot指明loader的位置，并将loader代码加载到内存，执行loader;
;目的：实际x86_64计算机需要启动后实现实模式到保护模式的切换等一系列配置操作，代码无法在一个sector中无法完成，
     因此将这些工作交给loader，需要重新从其他sector加载loader程序。
;-----------------------