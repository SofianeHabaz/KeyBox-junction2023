import 'package:keybox/home/models/seance.dart';

class Course {
  String id;
  String title;
  String description;
  String logo;
  int price;
  List<Seance> contenu;
  String domaine;
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.logo,
    required this.price,
    required this.contenu,
    required this.domaine,
  });

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? logo,
    int? price,
    List<Seance>? contenu,
    String? domaine,
  }) =>
      Course(
          id: id ?? this.id,
          title: title ?? this.title,
          description: description ?? this.description,
          logo: logo ?? this.logo,
          price: price ?? this.price,
          contenu: contenu ?? this.contenu,
          domaine: domaine ?? this.domaine);
  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        logo: json['logo'],
        price: json['price'],
        contenu: json['contenu'],
        domaine: json['domaine'],
      );
  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'description': description,
        'logo': logo,
        'price': price,
        'contenu': contenu,
        'domaine': domaine,
      };
}

final courses = [
  Course(
      id: '1',
      title: 'Python programming',
      description:
          'Ce cours a été conçu à l\'origine pour les étudiants débutants en programmation Python',
      logo: 'assets/python.png',
      domaine: 'Technologie et informatique',
      contenu: [
        Seance(
            id: '1',
            title: 'Introduction au cours python',
            description:
                'Introduction à Python, l\'environnement de travail Python et la syntaxe de base et exécution d\'instructions Python',
            date: DateTime(2023, 10, 10),
            duree: '3'),
        Seance(
            id: '2',
            title: 'Les variables et les types de valeurs python',
            description:
                'Les variables Python, les types de données ou types de valeurs Python, les opérateurs Python, les listes Python, les tuples Python, les dictionnaires Python et les ensembles ou sets Python',
            date: DateTime(2023, 10, 13),
            duree: '3'),
        Seance(
            id: '3',
            title: 'Les structures de controle python',
            description:
                'Les structures conditionnelles if, if…else et if…elif…else en Python, créer des conditions Python complexes et les boucles Python for et while',
            date: DateTime(2023, 10, 20),
            duree: '2'),
        Seance(
            id: '4',
            title: 'Les fonctions python',
            description:
                'Introduction aux fonctions Python, notions avancées sur les paramètres des fonctions Python, contrôle des valeurs de retour d\'une fonction Python, la portée des variables en Python et quelques fonctions Python utiles',
            date: DateTime(2023, 10, 23),
            duree: '2'),
        Seance(
            id: '5',
            title: 'Python orienté objet',
            description:
                'Introduction à l\'orienté objet en Python, classes, objets et attributs en Python orienté objet, héritage et polymorphisme en Python orienté objet, gérer la visibilité des membres de classe en Python orienté objet, itérateurs et générateurs en Python orienté objet',
            date: DateTime(2023, 10, 27),
            duree: '5'),
      ],
      price: 15000),
  Course(
      id: '2',
      title: 'Language C',
      description:
          'Ce cours a été conçu à l\'origine pour les étudiants débutants en programmation C',
      logo: 'assets/c.png',
      domaine: 'Technologie et informatique',
      contenu: [
        Seance(
            id: '1',
            title: 'Introduction au language C',
            description:
                'Introduction à C et la syntaxe de base et exécution d\'instructions C',
            date: DateTime(2023, 10, 8),
            duree: '3'),
        Seance(
            id: '2',
            title: 'Les variables et les types de valeurs C',
            description:
                'Les variables Python, les types de données ou types de valeurs C, les opérateurs et les listes',
            date: DateTime(2023, 10, 11),
            duree: '3'),
        Seance(
            id: '3',
            title: 'Les structures de controle C',
            description:
                'Les structures conditionnelles if, if…else et if…elif…else en C, créer des conditions C complexes et les boucles for et while',
            date: DateTime(2023, 10, 19),
            duree: '2'),
        Seance(
            id: '4',
            title: 'Les fonctions en C',
            description:
                'Introduction aux fonctions C, notions avancées sur les paramètres des fonctions C, contrôle des valeurs de retour d\'une fonction C, la portée des variables en C et quelques fonctions utiles',
            date: DateTime(2023, 10, 21),
            duree: '2'),
        Seance(
            id: '5',
            title: 'Les pointeurs',
            description: 'Introduction au pointeurs',
            date: DateTime(2023, 10, 25),
            duree: '5'),
      ],
      price: 17000),
  Course(
    id: '3',
    title: 'Arduino',
    description: 'Bien commencer avec Arduino : le guide du débutant',
    logo: 'assets/arduino.png',
    domaine: 'Electronique et robotique',
    price: 25000,
    contenu: [
      Seance(
          id: '1',
          title: 'Votre première carte Arduino',
          description: 'Introduction à l\'arduino et sa programmation ',
          date: DateTime(2023, 11, 10),
          duree: '3'),
      Seance(
          id: '2',
          title: 'Caractéristiques du produit',
          description: 'Les caracteristiques de l\'arduino',
          date: DateTime(2023, 11, 13),
          duree: '3'),
      Seance(
          id: '3',
          title: 'Les composants de base',
          description: 'Les composants de base d\'une carte arduino',
          date: DateTime(2023, 11, 20),
          duree: '2'),
      Seance(
          id: '4',
          title: 'Utiliser le logiciel Arduino',
          description:
              'Comment utiliser le logiciel arduino et tout ses caractéristiques',
          date: DateTime(2023, 11, 23),
          duree: '2'),
      Seance(
          id: '5',
          title: 'Le Starter Kit Arduino',
          description: 'Definir les starter Kit Arduino',
          date: DateTime(2023, 11, 27),
          duree: '5'),
    ],
  ),
  Course(
      id: '4',
      title: 'C++ programming',
      domaine: 'Technologie et informatique',
      description:
          'Ce cours a été conçu à l\'origine pour les étudiants débutants en programmation C++',
      logo: 'assets/cpp.png',
      contenu: [
        Seance(
            id: '1',
            title: 'Introduction au cours C++',
            description:
                'Introduction à C++, l\'environnement de travail C++ , la syntaxe de base et exécution d\'instructions C++',
            date: DateTime(2023, 10, 10),
            duree: '3'),
        Seance(
            id: '2',
            title: 'Les variables et les types de valeurs c++',
            description:
                'Les variables C++, les types de données ou types de valeurs C++, les opérateurs C++, les listes C++, les tuples C++, les dictionnaires C++ et les ensembles ou sets C++',
            date: DateTime(2023, 10, 13),
            duree: '3'),
        Seance(
            id: '3',
            title: 'Les structures de controle C++',
            description:
                'Les structures conditionnelles en c++, créer des conditions c++ complexes et les boucles',
            date: DateTime(2023, 10, 20),
            duree: '2'),
        Seance(
            id: '4',
            title: 'Les fonctions C++',
            description:
                'Introduction aux fonctions C++, notions avancées sur les paramètres des fonctions C++, contrôle des valeurs de retour d\'une fonction Python, la portée des variables eet quelques fonctions C++ utiles',
            date: DateTime(2023, 10, 23),
            duree: '2'),
        Seance(
            id: '5',
            title: 'C++ orienté objet',
            description:
                'Introduction à l\'orienté objet en C++, classes, objets et attributs orienté objet, héritage et polymorphisme en C++ orienté objet, gérer la visibilité des membres de classe en c++ orienté objet',
            date: DateTime(2023, 10, 27),
            duree: '5'),
      ],
      price: 10000),
  Course(
      id: '5',
      title: 'Machine Learning',
      domaine: 'Intelligence artificielle',
      description:
          'Ce cours a été conçu à l\'origine pour les étudiants intermédiaire en programmation Python et qui veulent apprendre l\'apprentissage automatique',
      logo: 'assets/ml.png',
      contenu: [
        Seance(
            id: '1',
            title: 'Introduction a l\'analyse des données ',
            description:
                'Introduction au methode d\'analyse des données avec pyhton ',
            date: DateTime(2023, 10, 10),
            duree: '3'),
        Seance(
            id: '2',
            title: 'Pandas and Numpy',
            description:
                'Pandas et NumPy sont deux bibliothèques Python très populaires utilisées dans l\'analyse des données et la manipulation de tableaux',
            date: DateTime(2023, 10, 13),
            duree: '3'),
        Seance(
            id: '3',
            title: 'Matplotlib',
            description:
                'Matplotlib est une bibliothèque de visualisation en Python qui permet de créer des graphiques et des tracés de manière efficace et personnalisée.',
            date: DateTime(2023, 10, 20),
            duree: '2'),
        Seance(
            id: '4',
            title: 'scikit learn',
            description:
                'Scikit-learn, également connu sous le nom de sklearn, est une bibliothèque open-source très populaire en Python dédiée à l\'apprentissage automatique (machine learning)',
            date: DateTime(2023, 10, 23),
            duree: '4'),
        Seance(
            id: '5',
            title: 'Projet',
            description: 'travailler sur un projet concret ',
            date: DateTime(2023, 10, 27),
            duree: '5'),
      ],
      price: 20000),
  Course(
      id: '6',
      title: 'JAVA programming',
      domaine: 'Technologie et informatique',
      description:
          'Ce cours a été conçu à l\'origine pour les étudiants débutants en programmation JAVA',
      logo: 'assets/java.png',
      contenu: [
        Seance(
            id: '1',
            title: 'Introduction au cours JAVA',
            description:
                'Introduction à C++, l\'environnement de travail JAVA , la syntaxe de base et exécution d\'instructions JAVA',
            date: DateTime(2023, 10, 10),
            duree: '3'),
        Seance(
            id: '2',
            title: 'Les variables et les types de valeurs JAVA',
            description:
                'Les variables JAVA, les types de données ou types de valeurs JAVA, les opérateurs JAVA, les listes JAVA, les tuples JAVA, les dictionnaires JAVA et les ensembles ou sets JAVA',
            date: DateTime(2023, 10, 13),
            duree: '3'),
        Seance(
            id: '3',
            title: 'Les structures de controle JAVA',
            description:
                'Les structures conditionnelles en JAVA, créer des conditions JAVA complexes et les boucles',
            date: DateTime(2023, 10, 20),
            duree: '2'),
        Seance(
            id: '4',
            title: 'Les fonctions JAVA',
            description:
                'Introduction aux fonctions JAVA, notions avancées sur les paramètres des fonctions JAVA, contrôle des valeurs de retour d\'une fonction JAVA, la portée des variables eet quelques fonctions JAVA utiles',
            date: DateTime(2023, 10, 23),
            duree: '2'),
        Seance(
            id: '5',
            title: 'JAVA orienté objet',
            description:
                'Introduction à l\'orienté objet en JAVA, classes, objets et attributs orienté objet, héritage et polymorphisme en JAVA orienté objet, gérer la visibilité des membres de classe en JAVA orienté objet',
            date: DateTime(2023, 10, 27),
            duree: '5'),
      ],
      price: 10000)
];
