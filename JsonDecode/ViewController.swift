//
//  ViewController.swift
//  JsonDecode
//
//  Created by humberto Lima on 12/08/2018.
//  Copyright © 2018 humberto Lima. All rights reserved.
//

import UIKit

struct curso: Decodable {
    let id: Int
    let nome: String
    let link: String
    let imgUrl: String
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        print("1")
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do {
                print("2")
                let cursos = try JSONDecoder().decode([curso].self, from: data)
                print("3")
                print(cursos)
            }catch{
                print("4")
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

