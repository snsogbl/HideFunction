# HideFunction
通过密码和手势开启隐藏功能


把屏幕分成4宫格，通过点击区域的对应码生成密码。简单的说，我现在顺序点击1234，那生成的密码是1234，再用1234和我预设的密码对比。很简单的功能，确保了普通用户不会发现这个入口。

设置分区数，默认四宫格

	[self.view setGridType:HideFunctionNineGrid];

###一句代码即可使用
<pre>
[self.view addHideFunction:^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"开启隐藏功能" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }];
</pre>



![](https://farm8.staticflickr.com/7692/16947384877_a225c28c9d_o_d.gif)