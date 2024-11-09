import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_loader/cubit/apod_cubit.dart';
import 'package:image_loader/cubit/apod_state.dart';
import 'package:image_loader/screens/apod_view.dart';
import 'package:image_loader/services/nasa_api_client.dart';

class ApodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Astronomy Picture of the Day')),
      body: BlocProvider(
        create: (context) => ApodCubit(
            NasaApiClient()), // Ensure this line initializes the Cubit
        child: ApodView(),
      ),
    );
  }
}

// class ApodView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: BlocConsumer<ApodCubit, ApodState>(
//         listener: (context, state) {
//           if (state is ApodSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Successfully fetched picture!')),
//             );
//           } else if (state is ApodError) {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text('Error'),
//                 content: Text(state.message),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.of(context).pop(),
//                     child: Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is ApodInitial) {
//             return ElevatedButton(
//               onPressed: () => context.read<ApodCubit>().fetchApod(),
//               child: Text('Fetch Picture'),
//             );
//           } else if (state is ApodLoading) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 10),
//                 Text('Fetching latest pic of the day...')
//               ],
//             );
//           } else if (state is ApodSuccess) {
//             final data = state.data;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.network(data['url']),
//                 SizedBox(height: 10),
//                 Text(
//                   data['title'] ?? 'No Title',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(data['explanation'] ?? 'No Description'),
//                 ),
//               ],
//             );
//           } else if (state is ApodError) {
//             return Text('An error occurred.');
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
