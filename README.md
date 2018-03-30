# transitionDemo
使用一个自定义转场，你需要一个动画控制器。每种转场需要的动画控制器不同。下表展示了如何为每种转场提供动画控制器。记着，委托方法总是返回动画控制器。

 ![image](https://github.com/xiaodai/transitionDemo/blob/master/1447917225914153.png)

动画控制器可以是任何遵守UIViewControllerAnimatedTransitioning协议的对象。该协议声明了两个必须要实现的方法。一个提供了动画的时间，另一个执行了动画。这些方法调用时都传递一个上下文。上下文提供了入口来访问信息和你创建自定义转场需要的对象。以下是一些重点：

* from view controller
* to view controller
* 两个视图控制器view的第一帧和最后一帧
* container view，根据这篇文档，“作为的转场中视图的父视图”
重要：上下文还实现了-completeTransition:，你必须在你自定义转场结束时调用一次。

Demo实现模态转场动画，效果如下：

 ![image](https://github.com/xiaodai/transitionDemo/blob/master/transitionDemo.gif)
