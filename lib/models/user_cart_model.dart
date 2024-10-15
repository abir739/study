import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

class UserCart extends ChangeNotifier {
  List<Product> productList = [
    Product(
        name: 'Montre Connectée HUAWEI Watch',
        price: '1479,000',
        oldPrice: '1580,000',
        image: 'lib/images/montre.jpg',
        description:
            '7 days battery life, Built-in GPS, With heart rate monitor, sleep monitor and pedometer, Water resistant smartwatch (5 ATM)'),
    Product(
        name: 'Montre Connectée HUAWEI Watch Fit 3 Blanc - Cuir',
        price: '699,000',
        oldPrice: '780,000',
        image: 'lib/images/prod1.jpg',
        description:
            'Écran couleur AMOLED 1,82- Systéme: Android 8.0/iOS 13.0 ou ultérieur - Connectivité: 2,4 GHz, Bluetooth 5.2 supportant BR et BLE - GNSS bande simple à cinq systèmes - Appel Bluetooth et notifications - Batterie: 400mAh - Autonomie: 7 jours'),
    Product(
        name: 'Smartphone SAMSUNG Galaxy Z Flip 6 12Go 256Go - Silver Shadow',
        price: '4799,000',
        oldPrice: '5880,000',
        image: 'lib/images/prod2.jpg',
        description:
            'Écran principal 6.7" AMOLED dynamique 2X, 120Hz, 2640 x 1080px (FHD+) - Écran externe: 3.4" Super AMOLED, 60Hz, 720 x 748px  - Verre Corning Gorilla Victus 2 - Armure en aluminium - Processeur: Snapdragon 8 Gen 3(4 nm) Octa-core - Système: Android 14 One UI 6.1.1 - Mémoire RAM: 12Go - Stockage: 256Go'),
    Product(
        name: 'Smartphone SAMSUNG GALAXY S24 Ultra',
        price: '5699,000',
        oldPrice: '5980,000',
        image: 'lib/images/prod3.jpg',
        description:
            'Écran 6.8" QHD+ Dynamic AMOLED 2X, 120Hz, HDR10+ (3120 x 1440px) - Corning Gorilla Armor - Armure en Titane - Processeur: Snapdragon 8 Gen 3(4 nm) Octa-core- Mémoire RAM: 12Go - Stockage: 256 Go - Moteur ProVisual: Caméra arrière Super HDR: Quad 200MP + 50 MP + 12MP + 10MP - Avant: 12 MP - zoom numérique 100x'),
  ];

  List<Product> getProductsList() {
    return productList;
  }

  List<Product> userProducts = [];

  List<Product> getUserProducts() {
    return userProducts;
  }

  void addProductToList(Product product) {
    userProducts.add(product);
    notifyListeners();
  }

  void removeProductFromList(Product product) {
    userProducts.remove(product);
    notifyListeners();
  }
}
