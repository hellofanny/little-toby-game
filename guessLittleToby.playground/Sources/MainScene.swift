
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
        labelDescription.fontName = "Helvetica"
        labelDescription.fontSize = 24
        labelDescription.fontColor = SKColor.black
        labelDescription.position = CGPoint(x:self.frame.midX, y:265)
        labelDescription.zPosition = 10
        self.addChild(labelDescription)
    }
    
    
    
    func loadOptions(){
        imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[0]), SKSpriteNode(imageNamed: "blank")))
        imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[1]), SKSpriteNode(imageNamed: "blank")))
        imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[2]), SKSpriteNode(imageNamed: "blank")))
        
        //adding the images
        imagesOptions[0].0.position = CGPoint(x:self.frame.midX-145, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[0].0)
        imagesOptions[1].0.position = CGPoint(x:self.frame.midX, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[1].0)
        imagesOptions[2].0.position = CGPoint(x:self.frame.midX+145, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[2].0)
        
        //adding the targets
        
        imagesOptions[0].1.position = CGPoint(x:self.frame.midX-145, y:imagesOptions[0].0.position.y-100);
        self.addChild(imagesOptions[0].1)
        imagesOptions[1].1.position = CGPoint(x:self.frame.midX, y:imagesOptions[1].0.position.y-100);
        self.addChild(imagesOptions[1].1)
        imagesOptions[2].1.position = CGPoint(x:self.frame.midX+145, y:imagesOptions[2].0.position.y-100);
        self.addChild(imagesOptions[2].1)

        
    }
    
    
    func checkAsnwer(){
        let i = roundOptions.index(of: round.answer)
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
            
            labelDescription.fontColor = SKColor.magenta
        }
        
        //if  touches.first != nil{
            
                
          //  }
          //  if (labelPersonName.text == "happy"){
            //    labelPersonName.removeFromParent()
            //}
            
         //   if(image2.description.contains(labelDescription.text!)){
             //   print("try again")
            
         //   }
        
    }
    
}
