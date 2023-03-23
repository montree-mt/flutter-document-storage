import 'package:ducument_storage/details.dart';
import 'package:ducument_storage/models/folder.dart';
import 'package:ducument_storage/models/recentfile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String urlProfile =
      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80';

  List<Folder> folders = [
    Folder(
        folderName: 'My document',
        storage: '12GB',
        lastEdit: '15-02-2023',
        colors: '#3a86ff'),
    Folder(
        folderName: 'Share with me',
        storage: '0GB',
        lastEdit: '15-02-2023',
        colors: '#2ec4b6'),
    Folder(
        folderName: 'Share',
        storage: '100GB',
        lastEdit: '15-02-2023',
        colors: '#ffbe0b'),
    Folder(
        folderName: 'Trash',
        storage: '800GB',
        lastEdit: '15-02-2023',
        colors: '#fb5607')
  ];

  List<RecentFile> recentfiles = [
    RecentFile(
        fileName: 'Desktop',
        imageUrl:
            'https://images.unsplash.com/photo-1661956602944-249bcd04b63f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    RecentFile(
        fileName: 'Laptop',
        imageUrl:
            'https://images.unsplash.com/photo-1661961112835-ca6f5811d2af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'),
    RecentFile(
        fileName: 'Laptop',
        imageUrl:
            'https://images.unsplash.com/photo-1661961112835-ca6f5811d2af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                right: 16,
                left: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(urlProfile),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Hi Montree!",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              "Document Storage",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "When to store document file, folder include many file formats",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/folder.png',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: [
                for (int i = 0; i < folders.length; i++)
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(),
                      ));
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: HexColor('${folders[i].colors}')
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${folders[i].storage}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 32),
                              Text(
                                "${folders[i].folderName}",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                              Text(
                                "Last edit: ${folders[i].lastEdit}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: HexColor('${folders[i].colors}'),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.folder,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Recent",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(20),
                children: [
                  for (int i = 0; i < recentfiles.length; i++)
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(14)),
                      child: Column(
                        children: [
                          Container(
                            height: 148,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(14),
                                topLeft: Radius.circular(14),
                              ),
                              child:
                                  Image.network('${recentfiles[i].imageUrl}'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${recentfiles[i].fileName}',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                ]),
          ],
        ),
      ),
    );
  }
}
