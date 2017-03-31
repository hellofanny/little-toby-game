
import Foundation
import SpriteKit

public class MainScene : SKScene{
    
    var personName = String()
    let labelPersonName = SKLabelNode()
    
    let labelSentence = SKLabelNode(text: "What I look like when I am:")
    
    var imagesOptions = [(SKSpriteNode,SKSpriteNode)]()
    
    /*var image0 = SKSpriteNode()
    var image1 = SKSpriteNode()
    var image2 = SKSpriteNode()

    let option0 = SKSpriteNode (imageNamed: "blank")
    let option1 = SKSpriteNode (imageNamed: "blank")
    let option2 = SKSpriteNode (imageNamed: "blank")
     */
    let labelDescription = SKLabelNode()
    var labelFeedback = SKLabelNode()
    
    var feedback = SKSpriteNode()
    
    
    let round = Round()
    var roundOptions = Array<String>()
    

    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 500, height: 600)
        self.backgroundColor = .white
        

        roundOptions = round.getOptions()
        print(round.answer)
        print(roundOptions)
        loadOptions()
        //var teste = round.answer
        //self.image.texture = SKTexture(imageNamed: teste)
        
        setPersonName()
        setSentence()
        
        setDescreptionLabel()
        //setImages()
       // setUpTargets()

        setFeedback()
        
        //setFeedbackLabel()
        print(imagesOptions[0].1.description)
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
        labelSentence.position = CGPoint(x: self.frame.midX, y: self.frame.midY+100)
        labelSentence.fontSize = 25
        self.addChild(labelSentence)
    }
    
    
    
    func setDescreptionLabel(){
        labelDescription.text = self.round.answer
        labelDescription.fontName = ".SFUIText"
        labelDescription.fontSize = 22
        labelDescription.fontColor = SKColor.black
        labelDescription.position = CGPoint(x:self.frame.midX, y:275)
        labelDescription.zPosition = 10
        self.addChild(labelDescription)
    }
    
    
    
    func loadOptions(){
        imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[0]), SKSpriteNode(imageNamed: "blank1")))
        imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[1]), SKSpriteNode(imageNamed: "blank1")))
        imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[2]), SKSpriteNode(imageNamed: "blank1")))
        
        //adding the images
        imagesOptions[0].0.position = CGPoint(x:self.frame.midX-145, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[0].0)
        imagesOptions[1].0.position = CGPoint(x:self.frame.midX, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[1].0)
        imagesOptions[2].0.position = CGPoint(x:self.frame.midX+145, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[2].0)
        
        //adding the targets
        
        imagesOptions[0].1.position = CGPoint(x:self.frame.midX-145, y:imagesOptions[0].0.position.y-90);
        self.addChild(imagesOptions[0].1)
        imagesOptions[1].1.position = CGPoint(x:self.frame.midX, y:imagesOptions[1].0.position.y-90);
        self.addChild(imagesOptions[1].1)
        imagesOptions[2].1.position = CGPoint(x:self.frame.midX+145, y:imagesOptions[2].0.position.y-90);
        self.addChild(imagesOptions[2].1)

        
    }
    
    
    func checkAsnwer(){
        let i = roundOptions.index(of: round.answer)
    }
    
    
    func setFeedback(){
        feedback = SKSpriteNode(imageNamed: "instruction")
        feedback.position = CGPoint(x: self.frame.midX, y: self.frame.minY+45)
        self.addChild(feedback)
        
    }
    
    
    func setFeedbackLabel(){
        labelFeedback.fontColor = SKColor.init(red: 96/255, green: 205/255, blue: 233/255, alpha: 1.0)
        //labelFeedback.fontColor = SKColor.black
        
        labelFeedback.fontName = ".SFUIText"
        labelFeedback.position = CGPoint(x: self.frame.midX, y: self.frame.minY+40)
        labelFeedback.fontSize = 20
        self.addChild(labelFeedback)
    }
    
    /*func setImages(){
        
        image0.texture = SKTexture(imageNamed: roundOptions[0])
        image0.position = CGPoint(x:self.frame.midX-145, y:self.frame.midY*0.85);
        self.addChild(image0)
        
        image1.texture = SKTexture(imageNamed: roundOptions[1])
        image1.position = CGPoint(x:self.frame.midX, y:self.frame.midY*0.85);
        self.addChild(image1)
        
        image2.texture = SKTexture(imageNamed: roundOptions[2])
        image2.position = CGPoint(x:self.frame.midX+145, y:self.frame.midY*0.85);
        self.addChild(image2)
    }
    */
    
    
    
    
   /* func setUpTargets(){
        // option1.color = .lightGray
        //  option1.size = CGSize(width: 130, height: 40)
        option0.position = CGPoint(x:self.frame.midX-145, y:self.image0.position.y-100);
        self.addChild(self.option0)
        
        option1.position = CGPoint(x:self.frame.midX, y:self.image0.position.y-100);
        self.addChild(self.option1)
        
        option2.position = CGPoint(x:self.frame.midX+145, y:self.image0.position.y-100);
        self.addChild(self.option2)
        
        
    }
  */
    
    
    /*  TA SUPER ERRADO ISSO!!!! #RESOLVER URGENTE
     
     func newRound(){
        imagesOptions.removeAll()
        roundOptions = round.getOptions()
        self.removeAllChildren()
        labelDescription.removeFromParent()
        setDescreptionLabel()
        loadOptions()
        
    }
 */
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let touchLocation = touch.location(in: self)
            labelDescription.position.x = touchLocation.x
            labelDescription.position.y = touchLocation.y
            
        }
        
    }
    
    
    
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (imagesOptions[roundOptions.index(of: round.answer)!].1.frame.contains(labelDescription.position)){
            print("entrou aqui")
            
            labelDescription.fontColor = SKColor.init(red: 96/255, green: 205/255, blue: 233/255, alpha: 1.0)
            labelDescription.fontName = ".SFUIText-Medium"
            
            labelFeedback.text = "WOW! You did great! :)"
            
            feedback.texture = SKTexture(imageNamed: "rightAnswer")
        
            
        }else{
            labelDescription.fontColor = SKColor.black
            labelDescription.fontName = ".SFUIText"
            
            labelFeedback.text = "oops...let's try again!"
            
             feedback.texture = SKTexture(imageNamed: "wrongAnswer")
            
            print("incorrect")
            
            
        }
        
    }
    
}
