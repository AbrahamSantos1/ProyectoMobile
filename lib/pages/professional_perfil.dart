import 'package:control_salud_infantil/components/my_appointment.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_recentmodifications.dart';
import 'package:control_salud_infantil/components/my_reviewcard.dart';
import 'package:control_salud_infantil/components/my_squaredbutton.dart';
import 'package:control_salud_infantil/models/doctores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// Asegúrate de importar tu componente ImageCarousel

class ProfessionalPerfil extends StatelessWidget {
  const ProfessionalPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = ModalRoute.of(context)!.settings.arguments as Doctor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil profesional',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // Aquí se envuelve el contenido en un SingleChildScrollView
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Information Section
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: GestureDetector(
                            onTap: () => {},
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.nombre, // Doctor's name
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                doctor.especialidad, // Doctor's specialty
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              // Buttons Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MySquareButton(
                    label: 'About',
                    icon: Icons.person,
                    color: Colors.white,
                    onPressed: () => {},
                  ),
                  MySquareButton(
                    label: 'Contact',
                    icon: Icons.phone,
                    color: Colors.white,
                    onPressed: () => {},
                  ),
                  MySquareButton(
                    label: 'Services',
                    icon: Icons.business_center,
                    color: Colors.white,
                    onPressed: () => {},
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Educación',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const AppointmentTile(
                title: 'Medical School',
                subtitle: 'University of Health Sciences',
                icon: Icons.heat_pump,
              ),
              const AppointmentTile(
                title: 'Board Certification',
                subtitle: 'American Board of Cardiology',
                icon: Icons.heat_pump,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Reseñas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Horizontal scrollable ReviewCard section
              const SizedBox(
                height: 100, // Set a fixed height for the ReviewCard area
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ReviewCard(
                        name: 'Messi',
                        rating: 5,
                        comment: 'Great product, really enjoyed it!',
                      ),
                      SizedBox(width: 10), // Add space between cards
                      ReviewCard(
                        name: 'El Bicho',
                        rating: 4,
                        comment: 'Good quality, but the shipping was slow.',
                      ),
                      SizedBox(width: 10), // Add space between cards
                      ReviewCard(
                        name: 'Emma Watson',
                        rating: 3,
                        comment: 'Average experience, could be better.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Noticias',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const ImageCarousel(
                description:
                    'Exciting breakthrough in heart disease treatment!',
                imageUrls: [
                  'https://fcb-abj-pre.s3.amazonaws.com/img/jugadors/MESSI.jpg',
                  'https://www.fichajes.com/build/images/player-covers/cristiano-ronaldo.352c95f5.jpg',
                  'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/J4FX5R5DURA7NJXMQIQKN4RFJ4.png'
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Especializaciones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          onTap: () => {},
                          text: 'Heart Health',
                          colorBG: Colors.white,
                          colorTxt: Colors.black,
                          hasBorder: true,
                          fontSize: 10,
                          widthButton: 150,
                          borderColor: Colors.grey,
                          icon: const Icon(Icons.medical_services),
                          iconColor: Colors.red,
                        ),
                        MyButton(
                          onTap: () => {},
                          text: 'Genetic Cardiology',
                          fontSize: 10,
                          colorBG: Colors.white,
                          colorTxt: Colors.black,
                          hasBorder: true,
                          widthButton: 150,
                          borderColor: Colors.grey,
                          icon: const Icon(Icons.person),
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      onTap: () => {},
                      text: 'Contact',
                      colorBG: Colors.white,
                      colorTxt: Colors.black,
                      hasBorder: true,
                      widthButton: 400,
                      borderColor: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      onTap: () => {},
                      text: 'Share',
                      colorBG: Colors.white,
                      colorTxt: Colors.black,
                      hasBorder: true,
                      widthButton: 400,
                      borderColor: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      onTap: () => {},
                      text: 'Book an Appointment',
                      colorBG: Colors.black,
                      colorTxt: Colors.white,
                      hasBorder: true,
                      widthButton: 400,
                      borderColor: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: FlutterMap(
                        options: const MapOptions(
                          initialCenter:
                              LatLng(-12.0464, -77.0428), // Coordenadas de Lima
                          initialZoom: 11,
                          interactionOptions: InteractionOptions(
                              flags: ~InteractiveFlag.doubleTapZoom),
                        ),
                        children: [
                          openStreetMapTileLater,
                          const MarkerLayer(markers: [
                            Marker(
                                point: LatLng(
                                    -12.0464, -77.0428), // Coordenadas de Lima
                                width: 60,
                                height: 60,
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.location_pin,
                                  size: 50,
                                  color: Colors.red,
                                ))
                          ])
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TileLayer get openStreetMapTileLater => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
