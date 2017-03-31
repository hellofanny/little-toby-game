import Foundation
import SpriteKit

class OptionCard:SKSpriteNode{
    
    let optionLabel = SKSpriteNode()
    let imageOption = SKSpriteNode()

    init(with node: SKSpriteNode) {
        super.init(texture: nil, color: SKColor.clear, size: node.size)
    
    
    
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
