import UIKit

// Efficiently bundling conditions
enum weather {
    case sunny, windy, raining, cloudy, snowing, night
}

var forecast = weather.snowing

switch forecast {
case weather.sunny:
    print("It's sunny")
case weather.raining:
    print("It's raining")
case weather.snowing:
    print("It's snowing")
default:
    print("No weather available") //put default at the end or else you're code won't work
}

// Fallthrough executes the following code in the cases - rarely used
var numberOfItemsInCart = 4

print("You've ordered the following:")
switch numberOfItemsInCart {
case 4:
    print("2 x pillows")
    fallthrough
case 3:
    print("1 x bed sheets")
    fallthrough
case 2:
    print("1 x pajama shorts")
    fallthrough
case 1:
    print("1 x teddy bear")
    fallthrough
default:
    print("End of cart.")
}
