
import Foundation
import SpriteKit

public class MainScene : SKScene{
    
    var personName = String()
    
    let labelStatement = SKLabelNode(text: "What I look like when I am:")
    
    var imagesOptions = [(SKSpriteNode,SKSpriteNode)]()
    
    let labelWord = SKLabelNode()
  
    var feedback = SKSpriteNode()
    var buttonNext = SKSpriteNode()
    
    
    let round = Round()
    var roundOptions = Array<String>()
    var roundCount:Int = 0
    
    var correct = Bool()
    
    
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 500, height: 600)
        self.backgroundColor = .white
        
        
        self.roundOptions = round.getOptions()
        self.loadOptions()
        self.setStatement()
        self.setDescreptionLabel()
        self.setFeedback()
        
    }
    

    
    func setStatement(){
        self.labelStatement.fontColor = SKColor.black
        self.labelStatement.position = CGPoint(x: self.frame.midX, y: self.frame.midY+100)
        self.labelStatement.fontSize = 25
        self.addChild(labelStatement)
    }
    
    
    
    func setDescreptionLabel(){
        self.labelWord.text = self.round.answer
        self.labelWord.fontName = ".SFUIText"
        self.labelWord.fontSize = 22
        self.labelWord.fontColor = SKColor.black
        self.labelWord.position = CGPoint(x:self.frame.midX, y:275)
        self.labelWord.zPosition = 10
        self.addChild(labelWord)

        //shaking the labelWord
        let leftPosition = SKAction.moveTo(x: self.labelWord.position.x-7, duration: 0.03)
        let rightPosition = SKAction.moveTo(x: self.labelWord.position.x+7, duration: 0.03)
        let centerPosition = SKAction.moveTo(x: self.labelWord.position.x, duration: 0.03)
        
        let sequence = SKAction.sequence([leftPosition,rightPosition,centerPosition])
        self.labelWord.run(.repeat(sequence, count: 7))
    
    }
    
    
    
    
    
    func loadOptions(){
        self.imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[0]), SKSpriteNode(imageNamed: "blank")))
        self.imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[1]), SKSpriteNode(imageNamed: "blank")))
        self.imagesOptions.append((SKSpriteNode(imageNamed:roundOptions[2]), SKSpriteNode(imageNamed: "blank")))
        
        //adding the images
        self.imagesOptions[0].0.position = CGPoint(x:self.frame.midX-145, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[0].0)
        self.imagesOptions[1].0.position = CGPoint(x:self.frame.midX, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[1].0)
        self.imagesOptions[2].0.position = CGPoint(x:self.frame.midX+145, y:self.frame.midY*0.95);
        self.addChild(imagesOptions[2].0)
        
        //adding the targets
        
        self.imagesOptions[0].1.position = CGPoint(x:self.frame.midX-145, y:imagesOptions[0].0.position.y-90);
        self.addChild(imagesOptions[0].1)
        self.imagesOptions[1].1.position = CGPoint(x:self.frame.midX, y:imagesOptions[1].0.position.y-90);
        self.addChild(imagesOptions[1].1)
        self.imagesOptions[2].1.position = CGPoint(x:self.frame.midX+145, y:imagesOptions[2].0.position.y-90);
        self.addChild(imagesOptions[2].1)
        
    }
    
    
    func setFeedback(){
        self.feedback = SKSpriteNode(imageNamed: "instruction")
        self.feedback.position = CGPoint(x: self.frame.midX, y: self.frame.minY+45)
        self.feedback.setScale(0.5)
        self.addChild(feedback)
        
    }
    
    
    func setRightAnswerFeedback(){
        self.feedback.texture = SKTexture(imageNamed: "rightAnswer")
        self.labelWord.fontColor = SKColor.init(red: 96/255, green: 205/255, blue: 233/255, alpha: 1.0)
        self.labelWord.fontName = ".SFUIText-Medium"
    }
    
    
    func setWrongAnswerFeedback(){
        self.feedback.texture = SKTexture(imageNamed: "wrongAnswer")
        self.labelWord.fontColor = SKColor.black
        self.labelWord.fontName = ".SFUIText"
    }
    
    func setNextbutton(){
        self.buttonNext = SKSpriteNode(imageNamed: "btn_next_normal")
        self.buttonNext.position = CGPoint(x: self.frame.midX+230, y: self.frame.minY+45)
        self.addChild(buttonNext)
    }
    
    
    //reset all
    func newRound(){
        self.correct = false
        self.imagesOptions.removeAll()
        self.roundOptions = round.getOptions()
        self.removeAllChildren()
        self.labelWord.removeFromParent()
        self.setStatement()
        self.setDescreptionLabel()
        self.feedback.removeFromParent()
        self.setFeedback()
        self.loadOptions()
    }
    
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        

        if (buttonNext.contains(touchLocation) && self.roundCount<5 && self.correct){
            self.buttonNext.texture = SKTexture(imageNamed: "btn_next_pressed")
            roundCount+=1
            self.newRound()
            
            
        }else if(buttonNext.contains(touchLocation) && roundCount==5){
            
            //end of the game
            let sceneMoveTo = LastScene(size: self.size)
            sceneMoveTo.scaleMode = self.scaleMode
            sceneMoveTo.personName = personName
            
            let transition = SKTransition.moveIn(with: .right, duration: 0.8)
            self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
            
        }
    }
    
    
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let touchLocation = touch.location(in: self)
            

            self.labelWord.position.x = touchLocation.x
            self.labelWord.position.y = touchLocation.y
            
            
        }
    }
    
    
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //only recognize in the blanket areas
        for blank in self.imagesOptions{
            if blank.1.frame.contains(self.labelWord.position){
                if (imagesOptions[roundOptions.index(of: self.round.answer)!].1.frame.contains(self.labelWord.position)){
                    
                    self.setRightAnswerFeedback()
                    
                    self.correct = true
                    self.setNextbutton()
                    
                }
                else{
                    
                    self.setWrongAnswerFeedback()
                }
            }
        }
    }
    
}
