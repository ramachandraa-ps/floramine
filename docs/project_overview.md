# Floramine App - Project Overview

## Introduction
Floramine is a Flutter-based e-commerce application focused on selling plants, gardening supplies, and related products. The app follows a modern design approach with a clean UI and comprehensive features for browsing, searching, and purchasing plant products.

## Project Structure

### Core Architecture
- Uses Provider pattern for state management
- Follows a service-based architecture for API calls
- Implements context classes for shared business logic

### Directory Structure
- `lib/` - Main application code
  - `models/` - Data models for the application
  - `providers/` - State management using Provider pattern
  - `screens/` - UI screens of the application
  - `services/` - API and backend services
  - `widgets/` - Reusable UI components
  - `context/` - Business logic contexts
  - `utils/` - Utility functions and helpers

### Key Features
1. User authentication (login, register, password reset)
2. Product browsing by categories and subcategories
3. Product search and filtering
4. Shopping cart functionality
5. Order management
6. User profile management
7. Payment methods integration
8. Support tickets and customer service
9. Gifting options and special offers
10. Rental services for plants

### Design System
- Uses the Poppins and Cabin font families
- Primary color scheme based on green (#54A801)
- Consistent UI components across the app
- Responsive design for different screen sizes

## API Integration
The app connects to a backend API at `https://erp.floramine.in/api` for:
- Product catalog
- Categories
- User authentication
- Order processing
- Support tickets

## Navigation
The app uses a combination of:
- Bottom navigation bar for main sections
- Named routes for screen navigation
- Push/pop navigation for detailed views

## State Management
- Provider package for app-wide state management
- ChangeNotifier-based classes for reactive UI updates
- Context classes for business logic separation 