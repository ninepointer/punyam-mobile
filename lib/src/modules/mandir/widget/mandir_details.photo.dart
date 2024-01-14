import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class MandirDetailsPhtosWidget extends StatelessWidget {
  final AllMandirData? templeDetails;

  const MandirDetailsPhtosWidget({Key? key, this.templeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: templeDetails?.images != null && templeDetails!.images!.isNotEmpty
          ? ImageGallery(images: templeDetails!.images!)
          : Center(
              child: Text('No photos available'),
            ),
    );
  }
}

class ImageGallery extends StatefulWidget {
  final List<MandirImages> images;

  const ImageGallery({Key? key, required this.images}) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FullScreenImage(
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

class FullScreenImage extends StatefulWidget {
  final List<MandirImages> images;
  final int currentIndex;

  const FullScreenImage(
      {Key? key, required this.images, required this.currentIndex})
      : super(key: key);

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
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
          // Positioned(
          //   top: 40,
          //   right: 16,
          //   child: Row(
          //     children: [
          //       IconButton(
          //         icon: Icon(Icons.arrow_back_ios),
          //         onPressed: () {
          //           // Handle go to the previous image
          //           if (currentIndex > 0) {
          //             setState(() {
          //               currentIndex--;
          //             });
          //           }
          //         },
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.arrow_forward_ios),
          //         onPressed: () {
          //           // Handle go to the next image
          //           if (currentIndex < widget.images.length - 1) {
          //             setState(() {
          //               currentIndex++;
          //             });
          //           }
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
