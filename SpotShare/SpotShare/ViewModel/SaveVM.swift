//
//  SaveVM.swift
//  SpotShare
//
//  Created by calmkeen on 2022/05/27.
//

import Foundation
import UIKit
import CoreData

class SaveVM: UIViewController{
    
    
    var models: [NSManagedObject] = [NSManagedObject]()
    var cnt = 0
    
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var deleteImageBtn: UIButton!
    @IBOutlet weak var SaveImageBtn: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageNameField: UITextField!
    @IBOutlet weak var ChooseAlert: UIButton!
    @IBOutlet weak var testbtn:UIButton!
    
    //coredata

    class PersistenceManager {
        static var shared: PersistenceManager = PersistenceManager()
        
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Contact")
            container.loadPersistentStores(completionHandler: {
                (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()

        var context: NSManagedObjectContext {
            return self.persistentContainer.viewContext
        }
    }


//    override func viewDidLoad() {
//        super.viewDidLoad()
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//          return
//        }
//        // 2
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contact")
//        // 3
//        do {
//          models = try managedContext.fetch(fetchRequest)
//        } catch let error as NSError {
//          print("Could not fetch. (error), (error.userInfo)")
//        }
//
//
//
//        // Do any additional setup after loading the view.
//    }
    //location 연결
    @IBAction func tesBtn(_ sender: UIButton){
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
                // 화면 전환 애니메이션 설정
                secondViewController.modalTransitionStyle = .coverVertical
                // 전환된 화면이 보여지는 방법 설정 (fullScreen)
                secondViewController.modalPresentationStyle = .fullScreen
                self.present(secondViewController, animated: true, completion: nil)
    }
//CoreData 저장
    func saveCoreData(title: String){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity =
            NSEntityDescription.entity(forEntityName: "Contact",
                                       in: context)!
        let person = NSManagedObject(entity: entity,
                                       insertInto: context)
        let png = self.ImageView.image?.pngData()
        person.setValue("" + ImageNameField.text!, forKeyPath: "title")
        person.setValue(png , forKeyPath: "image")
        
        do {
           try context.save()
           models.append(person)
         } catch let error as NSError {
           print("Could not save. (error), (error.userInfo)")
         }
    }
    //Coredata 삭제
    func deleteCoreData(title: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity =
            NSEntityDescription.entity(forEntityName: "Contact",
                                       in: context)!
        let person = NSManagedObject(entity: entity,
                                       insertInto: context)
        context.delete(person)
        //CoreData 값 초기화시 임의 값으로 전환
        ImageNameField.text = ""
        ImageView.image = UIImage(named: "주술회전")

        do {
            try context.save()
            
        } catch {
            print("error fetching data from context \(error)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func chooseAlert(_ sender: Any){
        AlertBtnClick()
    }
    
    @IBAction func IamgePhotoSaveBtn(_ sender: UIButton){
        let alert = UIAlertController(title: "저장", message: "저장되었습니다.", preferredStyle: UIAlertController.Style.alert)
        //CoreData 저장함수 호출
        saveCoreData(title: "")
        let save = UIAlertAction(title: "ok", style: .default)
        alert.addAction(save)
        present(alert, animated: true)
        
    }
    
    @IBAction func IamgePhotoDelBtn(_ sender: UIButton){
        let alert = UIAlertController(title: "삭제", message: "삭제되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let del = UIAlertAction(title: "ok", style: .cancel)
        alert.addAction(del)
        //CoreData 삭제 함수 호출
        deleteCoreData(title: "")
        present(alert, animated: true)
        
    }
}




// saveVM 알람기능 확장
extension SaveVM: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func AlertBtnClick(){
        let alert = UIAlertController(title: "선택", message: "이미지 첨부 방식을 선택해 주세요", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "카메라", style: .default){ [weak self] (_) in self?.ShowCamera()
        }
        let album = UIAlertAction(title: "앨범", style: .default) { [weak self] (_) in
            self?.ShowAlbum()
        }
        
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(album)
        
        present(alert, animated: true, completion: nil)
    }
    

    
    func ShowCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.cameraFlashMode = .on
        
        present(vc, animated: true, completion: nil)
    }
    func ShowAlbum(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        present(vc, animated: true, completion: nil)
        
    }
    // 여기부터
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("picker -> \(String(describing: info[UIImagePickerController.InfoKey.imageURL]))")
        
        if cnt % 2 == 0 {
            
            if let image = info[.editedImage] as? UIImage {
                ImageView.image = image
            }
            
        }
        else{
            
            if let image = info[.originalImage] as? UIImage {
                ImageView.image = image
            }
            
        }
        
        cnt += 1
        
        print(cnt)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
 
}


