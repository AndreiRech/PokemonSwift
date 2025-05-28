class Bag {
    private var items: [Item:Int] = [:]
    
    init(items: [Item:Int]) {
        self.items = items
    }
    
    init() {
        self.items = createItems()
    }
    
    func getItems() -> [Item:Int] { return self.items }
    
    func createItems() -> [Item:Int] {
        let potion = Item(name: "Potion", heal: 20)
        let superPotion = Item(name: "Super Potion", heal: 60)
        let hyperPotion = Item(name: "Hyper Potion", heal: 120)
        
        return [potion: 5, superPotion: 3, hyperPotion: 1]
    }
    
    func useItem(item: Item) -> Int? {
        if removeItem(item: item) {
            return item.getHeal()
        }
        return nil
    }
    
    func removeItem(item: Item) -> Bool{
        for (key, value) in self.items {
            if key == item && value > 0 {
                self.items[key] = value - 1
                return true
            }
        }
        return false
    }
    
}
