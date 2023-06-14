import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    var completionHandler: (UIImage) -> Void // Add completion handler
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Update the view controller if needed
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: ImagePickerView
        
        init(picker: ImagePickerView) {
            self.picker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            let flippedImage = UIImage(cgImage: selectedImage.cgImage!, scale: selectedImage.scale, orientation: .upMirrored)
            self.picker.selectedImage = flippedImage
            self.picker.completionHandler(flippedImage) // Call the completion handler with the flipped image
            self.picker.isPresented.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.picker.isPresented.wrappedValue.dismiss()
        }
        
        // Add a custom overlay view with a capture button
        func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
            guard let imagePicker = viewController as? UIImagePickerController else { return }
            
            let captureButton = UIButton(type: .system)
            captureButton.setTitle("Capture", for: .normal)
            captureButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            captureButton.setTitleColor(.white, for: .normal)
            captureButton.addTarget(self, action: #selector(captureButtonTapped), for: .touchUpInside)
            captureButton.translatesAutoresizingMaskIntoConstraints = false
            
            imagePicker.view.addSubview(captureButton)
            NSLayoutConstraint.activate([
                captureButton.centerXAnchor.constraint(equalTo: imagePicker.view.centerXAnchor),
                captureButton.bottomAnchor.constraint(equalTo: imagePicker.view.bottomAnchor, constant: -20)
            ])
        }
        
        @objc func captureButtonTapped() {
            // Handle the capture button tap action
        }
    }
}
