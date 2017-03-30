
import Foundation
import SpriteKit

public class MainScene : SKScene{
    
    var personName = String()
    let labelPersonName = SKLabelNode()
    
    let labelSentence = SKLabelNode(text: "What I look like when I am:")
    
    
    let image = SKSpriteNode(imageNamed: "sad")
    let image2 = SKSpriteNode (imageNamed: "happy")
    let image3 = SKSpriteNode (imageNamed: "tired")
    
    let labelDescription = SKLabelNode()
    
    let option1 = SKSpriteNode (imageNamed: "blank1")

    let round = Round()
    
    

    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 500, height: 600)
        self.backgroundColor = .white
        
    
        
        
       // round.getOptions()
        print(round.answer)
        
        
        //var teste = round.answer
        //self.image.texture = SKTexture(imageNamed: teste)
        
        setPersonName()
        
        setDescreptionLabel()
        setImages()
        setUpTargets()
        

        
        print(personName)
    }
    
    
    func setPersonName(){
        labelPersonName.text = self.personName
        labelPersonName.fontColor = SKColor.magenta
        labelPersonName.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        labelPersonName.zPosition = 10
        self.addChild(labelPersonName)

    }
    
    func setSentence(){
        labelSentence.fontColor = SKColor.black
        labelSentence.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(labelSentence)
    }
    
    
    
    
    
    func setImages(){
        image.position = CGPoint(x:self.frame.midX, y:self.frame.midY*0.75);
        self.addChild(image)
        
        image2.position = CGPoint(x:self.frame.midX+145, y:self.frame.midY*0.75);
        self.addChild(image2)
        
        image3.position = CGPoint(x:self.frame.midX-145, y:self.frame.midY*0.75);
        self.addChild(image3)
    }
    
    
    
    func setDescreptionLabel(){
        labelDescription.text = "tired"
        labelDescription.fontName = "Helvetica"
        labelDescription.fontColor = SKColor.black
        labelDescription.position = CGPoint(x:self.frame.midX, y:265)
        labelDescription.zPosition = 10
        self.addChild(labelDescription)
    }
    
    
    func setUpTargets(){
        // option1.color = .lightGray
        //  option1.size = CGSize(width: 130, height: 40)
        option1.position = CGPoint(x:self.frame.midX, y:self.image.position.y-100);
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
            if (labelPersonName.text == "happy"){
                labelPersonName.removeFromParent()
            }
        }
    }
    
    
}
