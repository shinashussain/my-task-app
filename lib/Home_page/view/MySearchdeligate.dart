import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_task_app/Home_page/model/Note.dart';
import 'package:my_task_app/authentication/viewmodel/authentication.dart';
import 'package:google_fonts/google_fonts.dart';

class MySearchDelegate extends SearchDelegate<Note?> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<QueryDocumentSnapshot>? _cachedResults;
  String? _cachedQuery;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black54),
      ),
    );
  }

  @override
  String get searchFieldLabel => 'Search notes...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          _cachedResults = null;
          _cachedQuery = null;
        },
        icon: const Icon(Icons.clear, color: Colors.black54),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back, color: Colors.black54),
    );
  }

  Future<List<QueryDocumentSnapshot>> _getSearchResults() async {
    if (query == _cachedQuery && _cachedResults != null) {
      return _cachedResults!;
    }

    final userId = Authentication().CurrentUser?.uid;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('note')
        .where('title', isGreaterThanOrEqualTo: query.toLowerCase())
        .where('title', isLessThanOrEqualTo: query.toLowerCase() + '\uf8ff')
        .get();

    _cachedResults = snapshot.docs;
    _cachedQuery = query;

    return snapshot.docs;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<QueryDocumentSnapshot>>(
      future: _getSearchResults(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: GoogleFonts.rubik(color: Colors.black54),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No notes found',
              style: GoogleFonts.rubik(color: Colors.black54),
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final doc = snapshot.data![index];
            final data = doc.data() as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    data['title'] ?? '',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    data['discription'] ?? '',
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  leading:
                      data['imageurl'] != null && data['imageurl'].isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                data['imageurl'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error,
                                      color: Colors.black54);
                                },
                              ),
                            )
                          : const Icon(Icons.note, color: Colors.black54),
                  onTap: () {
                    final note = Note(
                      data['title'] ?? '',
                      data['discription'] ?? '',
                      data['imageurl'] ?? '',
                      data['id'] ?? doc.id,
                    );
                    close(context, note);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
