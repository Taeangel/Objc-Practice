# Objc-SNS 
### **프로젝트 목적**

- ios에 대해 전반적으로 공부하기위해 Objective-C언어를 읽을 수 있어야 swift 기반 코드에 대해 공부할 수 있기 때문에 이 프로젝트를 진행하였습니다.

### 프로젝트 주요기능

- Firebase의 CRUD
- URLSession을 통한 unsplash의 Image api 통신
- ViewController 간 데이터 전달 방식으로 Notification, delegate, block 활용

### Objective-C에 대해 더 정확히 이해하기 위해 한 노력

- 애플 공식 문서와 Firebase 공식 문서를 참고하고 최대한 stackoverflow를 참고 하였습니다.
- Objective-C를 더 잘 이해하기 위해 Swift와의 비교를 하며 개발을 하였습니다. 두 언어의 차이점과 공통점을 파악하면 Objective-C의 특징을 보다 명확하게 이해할 수 있었습니다.

### **Objective-C를 공부하면서 어려웠던 점**

- Objective-C의 인자있는 메서드 네이밍 문제

```objectivec
- (id) initWith: (NSString *) nameValue withAge:(int)ageValue
```

 Objective-C 언어 특징상 첫번째 인자 네이밍을 할 수 없기 때문에 swift 처럼 네이밍을 지어줄 수 없었습니다. 

```objectivec
- (id) initWithName: (NSString *) nameValue withAge:(int)ageValue
```

그래서 메서드 네이밍을 첫번째 인자까지 생각하여 짓는 방식으로 코드를 작성하는 컨벤션을 지키며 프로젝트를 진행하였습니다. 

또한

```objectivec
- (id) initWithName: (NSString *) nameValue withAge:(int)ageValue
NS_SWIFT_NAME(init(withName:withAge:));
```

Objective-C로 만들어진 메서드들을 Swift에서 사용할경우 NS_SWIFT_NAME를 사용하여 

```swift
init(withName:"안녕", withAge: 5)
```

이와같이 기본 swift 에서 사용하는것처럼 네이밍을 변화시켜주는 키워드까지 공부하였습니다.

- 중복코드 문제

화면이동 메서드 중복 문제를 해결하기 위해 category를 사용하여 UIScrollerView UIViewController등 중복되는 코드들을 확장하여 코드의 확장성을 높였습니다.

```objectivec
+ (void)presentWithNavigation:(UIViewController *)caller {
  NSString * className = NSStringFromClass([self class]);
  UIStoryboard * storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
  UIViewController * popVc = [storyboard instantiateViewControllerWithIdentifier:className];
  UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:popVc];
  [navController setModalPresentationStyle: UIModalPresentationFullScreen];
  [caller presentViewController:navController animated:YES completion:nil];
}

- (BOOL)reachedBottom:(CGFloat)threshHold {
  CGFloat height = self.frame.size.height;
  CGFloat contentYOffset = self.contentOffset.y;
  CGFloat distanceFromBottom = self.contentSize.height - contentYOffset;
  
  BOOL reachedBottom = distanceFromBottom - threshHold < height;
  return reachedBottom;
}
```

- 동적타입 언어와 정적타입 언어 차이

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/75a17e71-60ab-4607-87bf-a3e7103e7113/Untitled.png)

Swift은 정적 타입 언어로, 컴파일 시에 타입 체크를 수행하여 타입이 맞지 않는 경우에는 컴파일 에러가 발생합니다. 프로젝트를 진행할 때, Swift를 사용하며 타입 체크를 통해 컴파일 에러가 발생한 부분을 수정해주는 방식으로 개발을 진행해왔습니다.

그러나 Objective-C 사용하면서 Swift로 작성한 코드를 사용할 때에는 언어 타입에 대한 고려가 필요합니다. Objective-C는 동적 타입 언어로, 런타임에 타입 체크가 이루어지기 때문에 컴파일 시에는 타입 에러가 발생하지 않습니다. 이는 Swift 코드를 Objective-C와 함께 사용할 때 런타임 오류가 발생할 수 있는 가능성을 내포하고 있습니다.

이러한 경험을 통해 현재 사용 중인 언어 타입의 장단점을 공부하게 되었습니다. 정적 타입 언어인 Swift의 장점은 컴파일 시에 타입 체크를 통해 오류를 사전에 감지할 수 있다는 것입니다. 이는 안정성과 신뢰성을 높여줍니다. 반면, 동적 타입 언어인 Objective-C는 컴파일 시에 타입 체크가 이루어지지 않기 때문에 런타임 오류가 발생할 수 있습니다. 이는 코드를 실행하기 전까지는 타입 오류를 확인할 수 없다는 점에서 제약이 있을 수 있습니다.

### Objective-C를 공부하면서 느낀점

Objective-C를 공부하게 된 계기는 기존에 작성된 Objective-C 코드를 읽기 위함이었습니다. 그러나 Objective-C를 공부하면서 Swift 언어를 사용할 때의 컨벤션 규칙 및 사용 방법을 더욱 이해할 수 있게 되었습니다. 또한, 정적 타입 언어와 동적 타입 언어의 차이에 대해서도 다시 공부하게 되었습니다.

Objective-C는 iOS 및 macOS 애플리케이션 개발에 오랜 기간 동안 사용된 언어이며, 많은 코드베이스와 라이브러리가 존재합니다. 따라서 기존 Objective-C 코드를 이해하고 읽을 수 있는 능력은 iOS 개발자에게 중요한 요소입니다. Objective-C 공부를 통해 Objective-C의 문법과 컨벤션, 프레임워크 사용 방법 등을 숙지하게 되면, 기존 코드를 보다 효율적으로 이해하고 유지보수할 수 있습니다.

또한, Objective-C와 Swift의 차이점에 대해 공부하면서 정적 타입 언어와 동적 타입 언어의 특징과 장단점을 다시 이해하게 되었습니다. Swift는 안전성을 강조하는 정적 타입 언어로, 컴파일 시점에서 많은 오류를 발견하고 예방할 수 있습니다. 반면, Objective-C는 동적 타입 언어로, 런타임에서 타입 체크를 수행하며 실행 시간에 오류가 발생할 수 있습니다. 이러한 차이점을 이해하면 Swift 코드를 작성할 때 타입 안정성을 강조하고 안전한 코드를 작성할 수 있습니다.

따라서, Objective-C를 공부하면서 Swift 언어에 대한 이해도를 향상시키고, 정적 타입 언어와 동적 타입 언어의 차이점을 인지하게 되었습니다. 이를 통해 iOS 애플리케이션 개발에 더욱 전문성을 갖추고, Objective-C와 Swift를 모두 활용하여 안정적이고 효율적인 코드를 작성할 수 있게 되었습니다.
