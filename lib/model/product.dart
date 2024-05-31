class Product {
    int id;
    String title;
    int price;
    String description;
    Category category;
    List<String> images;

    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.images,
    });

}

class Category {
    int id;
    String name;
    String image;

    Category({
        required this.id,
        required this.name,
        required this.image,
    });

}
