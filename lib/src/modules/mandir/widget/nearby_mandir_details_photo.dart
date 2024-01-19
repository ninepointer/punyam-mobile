import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class NaerByMandirDetailsPhtosWidget extends StatelessWidget {
  final TempleNearByMeList? templeDetails;

  const NaerByMandirDetailsPhtosWidget({Key? key, this.templeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: templeDetails?.images != null && templeDetails!.images!.isNotEmpty
          ? NearByImageGallery(images: templeDetails!.images!)
          : Center(
              child: Text('No photos available'),
            ),
    );
  }
}

class NearByImageGallery extends StatefulWidget {
  final List<TempleNearByMeImages> images;

  const NearByImageGallery({Key? key, required this.images}) : super(key: key);

  @override
  _NearByImageGalleryState createState() => _NearByImageGalleryState();
}

class _NearByImageGalleryState extends State<NearByImageGallery> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NearByFullScreenImage(
                  images: widget.images, currentIndex: currentIndex),
            ),
          );
        },
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return buildImageItem(widget.images[index].url ?? '');
          },
        ),
      ),
    );
  }

  Widget buildImageItem(String imageUrl) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class NearByFullScreenImage extends StatefulWidget {
  final List<TempleNearByMeImages> images;
  final int currentIndex;

  const NearByFullScreenImage(
      {Key? key, required this.images, required this.currentIndex})
      : super(key: key);

  @override
  _NearByFullScreenImageState createState() => _NearByFullScreenImageState();
}

class _NearByFullScreenImageState extends State<NearByFullScreenImage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: PageController(initialPage: currentIndex),
            itemCount: widget.images.length,
            onPageChanged: (index) {
              // Handle page changed if needed
            },
            itemBuilder: (context, index) {
              return Container(
                child: Image.network(
                  widget.images[index].url ?? '',
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
