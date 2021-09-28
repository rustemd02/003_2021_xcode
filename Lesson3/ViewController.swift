
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [.init(author: "Штаб", timestamp: "10 ч. назад", profilePicture: UIImage(named: "smart") ?? UIImage(), content: "Мы как и все видим этот обман, но призываем вас посмотреть немного шире. Если мы сейчас опустим руки, ничего не изменится. Если мы не дадим отпор, они еще больше будут наглеть, грабить, давить и унижать нас", contentPicture: nil),
                            .init(author: "Netflix", timestamp: "17 м. назад", profilePicture: UIImage(named: "netflix") ?? UIImage(), content: "Эстетика Тимоти Шаламе 😍", contentPicture: UIImage(named: "timothy") ?? UIImage()),
                            .init(author: "/vigvamcev", timestamp: "3 ч. назад", profilePicture: UIImage(named: "vigvamcev") ?? UIImage(), content: nil, contentPicture: UIImage(named: "komanda") ?? UIImage()),
                            .init(author: "Инде • Казань", timestamp: "7 ч. назад", profilePicture: UIImage(named: "inde") ?? UIImage(), content: "В Иннополисе беспилотные такси начнут работать без инженера-испытателя, который раньше располагался на переднем пассажирском сиденье, сообщили «Инде» в мэрии Иннополиса. Новый формат внедрят этой осенью, после вступления в силу соответствующего закона.", contentPicture: nil),
                            .init(author: "TJ", timestamp: "4 ч. назад", profilePicture: UIImage(named: "TJ") ?? UIImage(), content: "Здоровенные черви, спайс и «Страна Лимония»: как рунет встретил «Дюну» — один из самых ожидаемых фильмов года. 16 сентября в России и нескольких странах Европы вышла новая экранизация научно-фантастического романа Фрэнка Герберта «Дюна». По его сюжету человечество разделилось на могущественные кланы, каждый из которых живёт на своей планете. В центре внимания оказывается пустынный Арракис, где добывают пряность (в других переводах встречаются термины «спайс», «специи») — самое ценное вещество во вселенной. В России новая версия «Дюны» установила рекорд посещаемости с начала пандемии, а российские зрители принесли больше всего кассовых сборов.", contentPicture: nil),
                            .init(author: "OverFire", timestamp: "5 м. назад", profilePicture: UIImage(named: "overfire") ?? UIImage(), content: "Умилительный факт: на стене кошачьего кафе в Канедзаке висят фото котов разработчиков Blizzard", contentPicture: UIImage(named: "overwatch") ?? UIImage()),
                            .init(author: "INSTASAMKA x MONEYKEN | 12 НОЯБРЯ", timestamp: "4 ч. назад", profilePicture: UIImage(named: "instasamka") ?? UIImage(), content: "😱Казань, вас оказалось больше, чем ожидалось! В связи с этим мы вынуждены перенести концерт на 12 ноября в BIG TWIN ARENA", contentPicture: UIImage(named: "instasamka1") ?? UIImage()),
                            .init(author: "Рустам Минниханов", timestamp: "2 м. назад", profilePicture: UIImage(named: "rustam") ?? UIImage(), content: "Хаерле ирте!", contentPicture: UIImage(named: "utro") ?? UIImage()),
                            .init(author: "CТС Love", timestamp: "6 ч. назад", profilePicture: UIImage(named: "love") ?? UIImage(), content: "«Сердца за любовь» сегодня в 1:20 на СТС Love", contentPicture: UIImage(named: "heart") ?? UIImage()),
                            .init(author: "Netflix", timestamp: "2 ч. назад", profilePicture: UIImage(named: "netflix") ?? UIImage(), content: "Отис и Руби — любимая пара третьего сезона среди поклонников сериала «Сексуальное просвещение».", contentPicture: UIImage(named: "sex") ?? UIImage()),
                         .init(author: "Медуза", timestamp: "1 ч. назад", profilePicture: #imageLiteral(resourceName: "meduza"), content: "ДАННОЕ СООБЩЕНИЕ (МАТЕРИАЛ) СОЗДАНО И (ИЛИ) РАСПРОСТРАНЕНО ИНОСТРАННЫМ СРЕДСТВОМ МАССОВОЙ ИНФОРМАЦИИ, ВЫПОЛНЯЮЩИМ ФУНКЦИИ ИНОСТРАННОГО АГЕНТА, И (ИЛИ) РОССИЙСКИМ ЮРИДИЧЕСКИМ ЛИЦОМ, ВЫПОЛНЯЮЩИМ ФУНКЦИИ ИНОСТРАННОГО АГЕНТА.", contentPicture: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib.init(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextTableViewCell")
        self.tableView.register(UINib.init(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        self.tableView.register(UINib.init(nibName: "TextAndImageTableViewCell", bundle: nil), forCellReuseIdentifier: "TextAndImageTableViewCell")

        configure()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
}

// MARK: - Table view data source & delegate
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if (post.content != nil) && (post.contentPicture != nil){
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextAndImageTableViewCell", for: indexPath) as! TextAndImageTableViewCell
            cell.configure(post: post)
            return cell
        } else if post.content != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
            cell.configure(post: post)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
            cell.configure(post: post)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = posts[indexPath.row]
        
        if (post.content != nil) && (post.contentPicture != nil){
            return 400
        }
        if post.content != nil{
            return 100
        }
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let post = posts[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PostDetailViewController") as! PostDetailViewController
        vc.post = post
        navigationController?.pushViewController(vc, animated: true)
    }
}

