
import Foundation
import SpriteKit

public class MainScene : SKScene{
    
    var personName = String()
    
    let image = SKSpriteNode (imageNamed: "tired")
    
    let image2 = SKSpriteNode (imageNamed: "happy")
    
    let image3 = SKSpriteNode (imageNamed: "happy")
    
    
    let label = SKLabelNode(text: "What I look like when I am:")
    
    //text = Drop the word in the right sticker
    
    
    let labelName = SKLabelNode()
    let labelDescription = SKLabelNode()
    
    let label1 = SKLabelNode()
    
    let option1 = SKSpriteNode (imageNamed: "blank1")
    let option2 = SKSpriteNode()
    
    
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 500, height: 600)
        let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
        
        self.backgroundColor = .white
        
        label.fontColor = SKColor.black
        label.position = CGPoint(x: frame.size.width / 2.0, y: 430)
        label.fontSize = 20
        self.addChild(label)
        
        
        setUpTargets()
        image.position = CGPoint(x:self.frame.midX, y:self.frame.midY*0.75);
        self.addChild(image)
        
        image2.position = CGPoint(x:self.frame.midX+145, y:self.frame.midY*0.75);
        self.addChild(image2)
        
        image3.position = CGPoint(x:self.frame.midX-145, y:self.frame.midY*0.75);
        self.addChild(image3)
        
        
        setPersonName()
        setDescreptionLabel()
        print(personName)
        
    }
    
    func setPersonName(){
        labelName.text = personName
        labelName.fontColor = SKColor.magenta
        labelName.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(labelName)
    }
    
    func setDescreptionLabel(){
        labelDescription.text = "tired"
        labelDescription.fontName = "Helvetica"
        labelDescription.fontColor = SKColor.black
        labelDescription.position = CGPoint(x: frame.size.width / 2.0, y:265)
        self.addChild(labelDescription)
    }
    
    
    func setUpTargets(){
        // option1.color = .lightGray
        //  option1.size = CGSize(width: 130, height: 40)
        option1.position = CGPoint(x:self.frame.midX, y:self.image.position.y+55);
        self.addChild(self.option1)
        
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let touchLocation = touch.location(in: self)
            labelDescription.position.x = touchLocation.x
            labelDescription.position.y = touchLocation.y
            
            
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if  touches.first != nil{
            if (labelName.text == "happy"){
                labelName.removeFromParent()
            }
        }
    }
    
    
}
