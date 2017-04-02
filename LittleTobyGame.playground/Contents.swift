
/*:
  This mini game was made using the SpriteKit framework, mainly using SKScenes, SKLabelNodes, and SKSpriteNodes to design a user-friendly interface.
*/

import PlaygroundSupport
import SpriteKit

/*:
 # Little Toby Game
 The purpose of this game is to teach emotion words and feeling concepts to kids in a ludic way. Associate the words to the corresponding feeling expressed by little toby and match it.
 
 The game aims to:
 - aid in recognizing feelings;
 - help children improve basic coordination skills;
 - incorporate emotion words to their vocabulary
 
 ![](happy.png)
 */


//: ### Basic dimensions
let frame = CGRect(x: 0, y: 0, width: 550, height: 400)

//: ### Create a scene
var scene = FirstScene(size: frame.size)

//: ### Set up the view and show the scene
let view = SKView(frame: frame)
view.presentScene(scene)

PlaygroundPage.current.liveView = view

