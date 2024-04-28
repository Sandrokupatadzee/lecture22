//
//  FileManagerVC.swift
//  lecture22
//
//  Created by MacBook Pro on 28.04.24.
//

//import UIKit
//
//protocol FileManagerDelegate: AnyObject {
//    func didSelectImage(_ image: UIImage)
//}
//
//class FileManagerVC: UIViewController {
//    weak var delegate: FileManagerDelegate?
//    
//    private let imagePickerController = UIImagePickerController()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupImagePickerController()
//    }
//    
//    private func setupImagePickerController() {
//        imagePickerController.delegate = self
//        imagePickerController.sourceType = .photoLibrary
//    }
//    
//    @objc private func setImageButtonTapped() {
//        present(imagePickerController, animated: true, completion: nil)
//    }
//}
//
//extension FileManagerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, 
//didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true, completion: nil)
//        
//        guard let image = info[.originalImage] as? UIImage else {
//            return
//        }
//        
//        delegate?.didSelectImage(image)
//    }
//}
