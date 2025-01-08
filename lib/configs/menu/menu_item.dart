import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Inicio', subtitle: '', link: '/', icon: Icons.home),
  MenuItem(
      title: 'Buscar',
      subtitle: '',
      link: '/search',
      icon: Icons.search_rounded),
  MenuItem(
      title: 'Notificaciones',
      subtitle: 'Notificaciones de la aplicación',
      link: '/notifications',
      icon: Icons.notifications),
  MenuItem(
      title: 'Mis compras',
      subtitle: 'Historial de compras',
      link: '/purchases',
      icon: Icons.shopping_cart),
  MenuItem(
      title: 'Mis Productos',
      subtitle: 'Productos que he publicado',
      link: '/my-products',
      icon: Icons.shopping_bag),
  MenuItem(
      title: 'Favoritos',
      subtitle: 'Productos favoritos',
      link: '/favorites',
      icon: Icons.favorite),
  MenuItem(
      title: 'Ofertas',
      subtitle: 'Productos en oferta',
      link: '/offers',
      icon: Icons.local_offer),
  MenuItem(
      title: 'Mi cuenta',
      subtitle: 'Configuración de la cuenta',
      link: '/account',
      icon: Icons.account_circle),
  MenuItem(
      title: 'Acerca de Market Paisa',
      subtitle: 'Información sobre la aplicación',
      link: '/about',
      icon: Icons.info),
];
