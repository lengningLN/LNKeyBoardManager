# LNKeyBoardManager
极其简单、友好的管理键盘遮盖的框架



# Interduce 【简单介绍】
- 引入LNKeyBoardSender.h头文件
- 通过给关联对象textView、textField添加了 LN_KeyBoardDistance 和 LN_MoveView 两个属性
- 添加了LN_KeyBoardDistance 表示键盘和输入视图之间的间隔
- 添加了LN_MoveView  表示被键盘遮挡后需要移动那个视图，一般就是输入框的父视图

# Features【能做什么】
 - [x] 处理textField、textView在普通视图中被遮挡
 - [x] 处理textField、textView在普通的tableview的cell中被遮挡
 - [x] 处理textField、textView在tableViewController的cel中被遮挡
 
 
# 目前存在的问题
1. UITableViewController的cell中如果含有输入框，系统自己处理，目前不能设置间隔


# Class【使用到的类】
1. LNKeyBoardManager   
2. LNKeyBoardResponder
3. LNKeyBoardSender

# Getting Started【开始使用】

## 效果演示

详情看Demo

## 文字介绍
- 把LNKeyBoardManager、LNKeyBoardResponder和LNKeyBoardSender拖进工程中
- 在需要的地方引入LNKeyBoardManager的头文件
- 设置LN_KeyBoardDistance、LN_MoveView 属性

## 代码介绍
- 在普通的视图中
```
    self.downField.LN_MoveView = self.view;
    self.downField.LN_KeyBoardDistance = 15;
```

- 在cell中
```
/**
    LNCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LNCell"];
    cell.textField.LN_MoveView = tableView;
    cell.textField.LN_KeyBoardDistance = 30;
    return cell;
/**



# more about  【更多】
1. 如果有什么问题，请在[issues](https://github.com/lengningLN/LNSwipeCellDemo/issues)区域提问，我会抽时间改进。
2. [我的博客](https://www.jianshu.com/u/dbd52f0e4f1c)
### 打赏
![](http://m.qpic.cn/psb?/V11R4JcH0fAdbu/h4vWrizoOlby*zntVMiu.1F9CMMMx2T9BOWUjSEnCE8!/b/dDUBAAAAAAAA&bo=nALQAgAAAAADB24!&rf=viewer_4)
