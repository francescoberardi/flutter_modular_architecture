# flutter_modular_architecture

A Flutter project for testing modular architecture.

## Getting Started

This project is a mono repository for a Flutter application splitted in different packages.

There are the main app app project, a "core" directory with some basic packages and a "features" directory that should contains the features packages.
  
- CORE: Inside the core directory there are the packages needed by almost all features
- FEATURES: Inside the features directory there are all the app features

The bootstrap of the project is handled by [MELOS](https://docs.page/invertase/melos)
To use it you should configure melos command on your machine following this instructions: https://docs.page/invertase/melos/getting-started
