import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:riverpod_vs_provider/firstBloc/first_bloc.dart';
import 'package:riverpod_vs_provider/secondBloc/second_bloc.dart';

// without riverpod
// void main() => runApp(MyApp());

// with riverpod
// void main() => runApp(ProviderScope(child: MyApp()));

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: MyWidget(),
//       ),
//     );
//   }
// }

// -------------------------- provider ------------------------------------

// class MySecondClass {
//   final MyFirstClass myFirstClass;
//
//   MySecondClass(this.myFirstClass);
// }
//
// class MyFirstClass {
//   final val = 'value';
// }

// single provider

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => MyFirstClass(),
//       child: ProxyProvider<MyFirstClass, MySecondClass>(
//         update: (context, firstClass, previous) => MySecondClass(firstClass),
//         child: Builder(
//           builder: (context) {
//             return Text(context
//                 .read<MySecondClass>()
//                 .myFirstClass
//                 .val);
//           },
//         ),
//       ),
//     );
//   }
// }

// provider with getIt

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => getIt.get<MySecondClass>(),
//       child: Builder(
//         builder: (context) {
//           return Text(context
//               .read<MySecondClass>()
//               .myFirstClass
//               .val);
//         },
//       ),
//     );
//   }
// }

// bloc with provider and getIt
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => inject<InviteBloc>(),
//       child: BlocConsumer<InviteBloc, InviteState>(
//         listener: (BuildContext context, InviteState state) {},
//         builder: (BuildContext context, state) {
//           final bloc = context.watch<InviteBloc>();
//           return Container();
//         },
//       ),
//     );
//   }
// }

// bloc with provider and getIt
// correct object

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => inject<FirstBloc>(),
//       child: BlocProvider(
//         create: (BuildContext context) => inject<FirstBloc>(),
//         child: BlocConsumer<FirstBloc, FirstState>(
//           listener: (BuildContext context, FirstState state) {},
//           builder: (BuildContext context, state) {
//             return FlatButton(
//                 onPressed: () => context.read<FirstBloc>().doSomething(),
//                 child: Container());
//           },
//         ),
//       ),
//     );
//   }
// }

// when I want to get object that is not provided
// I have only runtime exception instead of compile

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => inject<FirstBloc>(),
//       child: BlocConsumer<FirstBloc, FirstState>(
//         listener: (BuildContext context, FirstState state) {},
//         builder: (BuildContext context, state) {
//           return FlatButton(
//               onPressed: () => context.read<SecondBloc>().doSomething(),
//               child: Container());
//         },
//       ),
//     );
//   }
// }

// --------------------------- riverpod ----------------------------------

// final stringProvider = Provider((ref) => 'hello');
// final intProvider = Provider((ref) => 12);

// class MyApp extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final string = watch(stringProvider);

// scopedReader listens to provided value and rebuilds
// widget when value changes
// return MaterialApp(
//   home: Scaffold(
//     body: Text(string),
//   ),
// );
// }
// }

//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Consumer(
//           builder: (context, watch, child) {
//             return Text(watch(stringProvider));
//           },
//         ),
//       ),
//     );
//   }
// }

// class IncrementNotifier extends ChangeNotifier {
//   int _value = 0;
//   int get value => _value;
//
//   void increment() {
//     _value += 1;
//     notifyListeners();
//   }
// }
//
// final firstIncrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());
// final secondIncrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());
//
// advantage of riverpod over provider
// we can choose object base on the reference
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Consumer(
//           builder: (context, watch, child) {
//             final incrementNotifier = watch(firstIncrementProvider);
//             return Text(incrementNotifier.value.toString());
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             context.read(secondIncrementProvider).increment();
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
//
// class FakeHttpClient {
//   Future<String> get(String url) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return 'Response from $url';
//   }
// }
//
// final fakeHttpClientProvider = Provider((ref) => FakeHttpClient());
//
// final responseProvider = FutureProvider<String>((ref) async {
//   final httpClient = ref.read(fakeHttpClientProvider);
//   return httpClient.get('https://allbright.io/');
// });
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Consumer(
//             builder: (context, watch, child) {
//               final AsyncValue responseAsyncValue = watch(responseProvider);
//               return responseAsyncValue.map(
//                 data: (_) => Text(_.value),
//                 loading: (_) => CircularProgressIndicator(),
//                 error: (_) => Text(
//                   _.error.toString(),
//                   style: TextStyle(color: Colors.red),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
