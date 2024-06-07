import 'package:code_generation_flutter/src/blocs/bloc/user_bloc.dart';
import 'package:code_generation_flutter/src/presentations/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(const GetUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is GettingUsers) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetUsersError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () =>
                          context.read<UserBloc>().add(const GetUsersEvent()),
                      child: const Text(
                        'Reload',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is UsersLoaded) {
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<UserBloc>().add(const GetUsersEvent()),
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return UserTile(user: user);
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
