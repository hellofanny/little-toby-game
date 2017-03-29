
import UIKit
import PlaygroundSupport
import SpriteKit

/*:
 # Testing
 */
let myVC = PlaygroundViewController()

//: Basic dimensions that we will use more later
let frame = CGRect(x: 0, y: 0, width: 550, height: 400)


//: Create a scene, add something to it
var scene = MyScene(size: frame.size)
//troca aqui depois
//: Set up the view and show the scene
let view = SKView(frame: frame)
view.presentScene(scene)

PlaygroundPage.current.liveView = view

