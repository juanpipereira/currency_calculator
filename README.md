# Currency Calculator

A simple and intuitive currency exchange calculator application built with Flutter. This app allows users to convert between various FIAT and Crypto currencies, providing real-time exchange rates.

## Features
- Convert between FIAT and CRYPTO currencies.
- Fetches real-time exchange rates from a public API.
- User-friendly interface.

## Demo
|Demo video|
|-|
|<video src="https://github.com/user-attachments/assets/3e1642d5-325b-4f57-bff3-81dc9c8eef63">|




## Getting Started

### Prerequisites
- Flutter SDK installed.
- A code editor like VS Code or Android Studio.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/juanpipereira/currency_calculator.git
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

## Tools and Technologies Used
-   **Flutter** 
-   **Riverpod:** A robust and testable state-management solution for Flutter applications.
-   **Riverpod Generator:** Code generator for Riverpod.
-   **http:** Library for making HTTP requests.

## API
-   **URL:** `https://74j6q7lg6a.execute-api.eu-west-1.amazonaws.com/stage/orderbook/public/recommendations`
-   **Query Parameters:**
    -   `type`: `0` for CRYPTO to FIAT, `1` for FIAT to CRYPTO
    -   `cryptoCurrencyId`: The ID of the cryptocurrency
    -   `fiatCurrencyId`: The ID of the fiat currency
    -   `amount`: The amount to exchange
    -   `amountCurrencyId`: The ID of the input currency

The exchange rate can be obtained from `data.byPrice.fiatToCryptoExchangeRate` in the API response.
