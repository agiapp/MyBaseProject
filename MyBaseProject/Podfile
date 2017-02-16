# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

#去掉由pod引入的第三方库的警告（注：拖入引入..的警告不能去掉）需要使用更新命令才生效。
inhibit_all_warnings!

target 'MyBaseProject' do
# 1、Github排名第一的网络操作框架,底层是用NSURLSession+NSOperation(多线程)
pod 'AFNetworking'
# 2、把系统的target+selector/委托模式 转为 Block语法,让代码结构更加紧凑
pod 'BlocksKit'
# 3、对系统原生的AutoLayout的NSLayoutConstraints类的封装,优雅的链式语法,Github排名第三
pod 'Masonry'
# 4、为滚动控件(UIScrollView,UITableView,UICollectionView)添加头部和脚部刷新UI
pod 'MJRefresh'
# 5、为UI控件提供网络图片加载和缓存功能,AF已经整合了此功能,一般用AF就够了,据专业人士说:SD比AF快0.02秒. 如果同时引入AF和SD, 那么AF的网络图片加载方法会被划线.
pod 'SDWebImage'
# 6、对系统Sqlite的封装,使用SQL语句操作数据库
pod 'FMDB'
# 7、对CFNetwork操作Socket通讯的封装, 变为易懂好用的OC语法
pod 'CocoaAsyncSocket'
# 8、侧边栏--参考QQ的侧边栏
pod 'RESideMenu'
# 9、在屏幕中间显示忙 -- 小菊花, 类似于安卓的toast效果
pod 'MBProgressHUD'
# 10、专门用于转换Array/Dictionary -> 对象模型, 主要用于JSON解析,基本上工作都用这个框架(必会)
pod 'MJExtension'
# 11、对NSLog进行的封装,效率比NSLog高,大量打印不卡顿,可以分级打印
pod 'CocoaLumberjack'
# 12、实现滚动控件中,弹出键盘时,自动移动输入框位置,防止被键盘遮盖的功能
pod 'TPKeyboardAvoiding'
# 13、实现iOS7以后,自定义左上角返回控件,导致手势的左滑返回失效问题
pod 'MLTransition'
# 14、实现iOS系统邮件的,Cell左划显示多个按钮的模式
pod 'SWTableViewCell'
# 15、网络或本地 多张图片浏览 控制器
pod 'MWPhotoBrowser'
  
end
