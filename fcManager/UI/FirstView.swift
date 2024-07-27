//
//  FirstView.swift
//  taxi
//
//  Created by 조경민 on 7/10/24.
//

import SwiftUI

struct FirstView: View {
    @State var url = "https://open.api.nexon.com/heroes/v1/id?character_name="
    @State var userName:String = ""
    var body: some View {
        HStack{
            TextField(
                "닉네임으로 검색", text: $userName
            )
            .padding()
            .frame(width: 250)
            
            Button(
                action: {requestPost(url: url, method: "get", param: userName)}, label: {
                    Image(systemName: "magnifyingglass")
                }
            )
            
            
        }
    }
}



/* Body가 있는 요청 */
func requestPost(url: String, method: String, param: String) {
    var API_KEY:String =     "test_13074c25d3e6df151f5e21b8b7d7c2c0c989968c78859fba65c712d5c249f8e0efe8d04e6d233bd35cf2fabdeb93fb0d"
    let url = URL(string: url + param)

    //Request 객체
    var request = URLRequest(url: url!)
    request.httpMethod = method
            
    //URLSessionConfiguration - shared(singleton)
    //URLSessionTask - DataTask
    //Completion Handler를 통한 Response 처리
    let dataTask = URLSession.shared.dataTask(with: request, completionHandler: {[weak self] data, response, error in
        guard error == nil,
        let response = response as? HTTPURLResponse,
        let data = data,
        //응답으로 받은 JSON Decoding
        let movie = try? JSONDecoder().decode([movie].self, from: data) else{
              print("ERROR : URLSesstion data task \(error?.localizedDescription ?? "")")
              return
         }

        //상태 확인
        switch response.statusCode {
           case (200...299): //성공
              self.movieList += movie

              DispatchQueue.main.async {
                self.tableView.reloadData()
              }
                    
           case (400...499): //client error
              print("""
                 ERROR: Client Error - \(response.statusCode)
                 Response: \(response)
              """)
             
           case(500...599): //server error
              print("""
                 ERROR: Server Error - \(response.statusCode)
                 Response: \(response)
              """)
             
           default:
              print("""
                 ERROR: \(response.statusCode)
                 Response: \(response)
              """)
       }
    })

    //선언 후 꼭 resume(실행)을 해주어야 함
    dataTask.resume()
    print(url+param)
    print(method)
    
//    var result = requests.get(urlparse(url).geturl(),
//                            headers = {"Authorization" : key})

}

#Preview {
    FirstView()
}

