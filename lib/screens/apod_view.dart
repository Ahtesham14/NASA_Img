import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/apod_cubit.dart';
import '../cubit/apod_state.dart';

class ApodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<ApodCubit, ApodState>(
        listener: (context, state) {
          if (state is ApodError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is ApodLoading) {
            return CircularProgressIndicator();
          } else if (state is ApodSuccess) {
            final apodData = state.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(apodData.url),
                SizedBox(height: 10),
                Text(apodData.title),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(apodData.explanation),
                ),
              ],
            );
          } else if (state is ApodError) {
            return Text('An error occurred.');
          }
          // Initial state with a button to start loading data
          return ElevatedButton(
            onPressed: () => context.read<ApodCubit>().fetchApod(),
            child: Text('Fetch Picture of the Day'),
          );
        },
      ),
    );
  }
}
