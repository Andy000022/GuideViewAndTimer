# GuideViewAndTimer
封装的引导页和定时器


    //引导页使用
    let defaults = UserDefaults.standard
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.bool(forKey: "first")

        self.title = "引导页"
        
        self.view.backgroundColor = UIColor.white
        // 判断是否第一次启动
        if !defaults.bool(forKey: "first") {
            
            defaults.set(true, forKey: "first")
            // 引导页
            setupGudienceView()
            
        }
    
    }
    
    // 引导页设置
    func setupGudienceView() {
    
        let vc = GuideViewController()
        // 引导页image数组
        vc.imgArr = ["yindao_1","yindao_2","yindao_3","yindao_4"]
        // 引导页倒计时
        vc.timeCode = 10
        vc.modalTransitionStyle = .coverVertical
        
        let keyRootView = UIApplication.shared.keyWindow?.rootViewController
        
        DispatchQueue.main.async {
            
            keyRootView?.present(vc, animated: false) {
                
            }
        }
    }
    
    
    
    // 验证码倒计时使用
    
    var codeView = MyPrivateTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 120, height: 35))
        self.view.addSubview(btn)
        btn.setTitle("获取验证码", for: .normal)
        btn.backgroundColor = UIColor.init(hexString: "e3e2e0")
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.layer.cornerRadius = 5
        
        // 自定义倒计时时间
        
        codeView.timeCode = 50
        
        codeView.codeBtn = btn
        
        btn.addTarget(self, action: #selector(self.timeDown), for: .touchUpInside)
    
    }
 
 
    @objc fileprivate func timeDown() { 
        // 调用定时器的方法
        
        codeView.isRestTime = true
        
    }
