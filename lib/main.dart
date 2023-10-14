import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(FindADoctorApp());
}

class FindADoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DoctorTypeIcons(),
          ],
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String description;
  final double rating;
  final String image;

  Doctor(this.name, this.description, this.rating, this.image);
}

class DoctorTypeIcons extends StatelessWidget {
  final List<Doctor> heartDoctors = [
  Doctor('Dr. Smith', 'Cardiologist', 4.9, 'assets/dr austin.png'),
];

final List<Doctor> lungDoctors = [
  Doctor('Dr. Chang', 'Pulmonologist', 4.7, 'assets/dr chang.png'),
];

final List<Doctor> boneDoctors = [
  Doctor('Dr. Chavez', 'Orthopedic Surgeon', 4.5, 'assets/dr chavez.png'),
];

final List<Doctor> eyeDoctors = [
  Doctor('Dr. Kung', 'Ophthalmologist', 4.3, 'assets/dr kung.png'),
];
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
      IconButton(
        iconSize: 75,
        icon: Icon(FontAwesomeIcons.heart), 
        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorListScreen(heartDoctors)));},
      ),
      Text('Heart doctors',style: TextStyle(fontSize: 20),),
      IconButton(
        iconSize: 75,
        icon: Icon(FontAwesomeIcons.eye), 
        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorListScreen(eyeDoctors)));},
      ),
      Text('Eye doctors',style: TextStyle(fontSize: 20),),
      IconButton(
        iconSize: 75,
        icon: Icon(FontAwesomeIcons.bone), 
        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorListScreen(boneDoctors)));},
      ),
      Text('Bone doctors',style: TextStyle(fontSize: 20),),
      IconButton(
        iconSize: 75,
        icon: Icon(FontAwesomeIcons.lungs), 
        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorListScreen(lungDoctors)));},
      ),
      Text('Lung doctors',style: TextStyle(fontSize: 20),),
     ],
    );
  }
}

class DoctorListScreen extends StatelessWidget {
  final List<Doctor> doctors;

  DoctorListScreen(this.doctors);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Doctors'),centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(doctors[index].image),
            ),
            title: Text(doctors[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetailsScreen(doctors[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DoctorDetailsScreen extends StatelessWidget {
  final Doctor doctor;

  DoctorDetailsScreen(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Column(
        children: [
          Image.asset(doctor.image),
          SizedBox(height: 15,),
          Text('Name: ${doctor.name}',style: TextStyle(fontSize: 20),),
          Text('Description: ${doctor.description}',style: TextStyle(fontSize: 20),),
          SizedBox(height: 15,),
          Text('Rating: ${doctor.rating}',style: TextStyle(fontSize: 20),),
          RatingBar(
            initialRating: doctor.rating, 
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5, 
            itemSize: 30, 
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            ratingWidget: RatingWidget(
              full: Icon(Icons.star, color: Colors.amber),
              half: Icon(Icons.star_half, color: Colors.amber),
              empty: Icon(Icons.star_border, color: Colors.grey),
            ),
            onRatingUpdate: (rating) {
              
            },
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: () {
              
            },
            child: Text('Make an Appointment',style: TextStyle(fontSize: 25),),
          ),
        ],
      ),
    );
  }
}


