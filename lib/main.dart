import 'package:flutter/material.dart';

void main() {
  runApp(const FalconTimes());
}

const gold = Color(0xFFD4AF37);
const black = Color(0xFF090909);
const cardColor = Color(0xFF191919);
const imageBackground = Color(0xFFF3F0E8);

// WATCH MODEL

class Watch {
  final String brand;
  final String model;
  final String price;
  final String image;
  final String description;

  const Watch(this.brand, this.model, this.price, this.image, this.description);
}

// WATCH COLLECTION

const List<Watch> watches = [
  Watch(
    'ROLEX',
    'Submariner',
    '₹11,04,000',
    'https://media.rolex.com/image/upload/q_auto/f_auto/t_v7-cover-majesty-landscape/c_limit%2Cw_1920/v1/a677b2c664f6/catalogue/2026/upright-c/m126610ln-0001',
    'Iconic black-dial diver watch.',
  ),
  Watch(
    'OMEGA',
    'Seamaster',
    '₹5,50,000',
    'https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=800',
    'Sporty luxury watch style.',
  ),
  Watch(
    'SEIKO',
    'Prospex Diver',
    '₹45,000',
    'https://images.unsplash.com/photo-1547996160-81dfa63595aa?w=800',
    'Rugged diver-style watch.',
  ),
  Watch(
    'TISSOT',
    'PRX Chronograph',
    '₹2,20,500',
    'https://www.tissotwatches.com/dw/image/v2/BKKD_PRD/on/demandware.static/-/Sites-Tissot-Catalogue/default/dw79af40c4/product-pictures/ee366fd4-7d3b-4cc8-8d59-07b9892ab1a5_T137-427-11-011-00_shadow.png?sh=800&sm=fit&sw=800',
    'Integrated-bracelet chronograph.',
  ),
  Watch(
    'CASIO',
    'G-Shock',
    '₹9,000',
    'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?w=800',
    'Bold and sporty watch style.',
  ),
  Watch(
    'FOSSIL',
    'Grant Chronograph',
    '₹15,000',
    'https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?w=800',
    'Classic chronograph style.',
  ),
  Watch(
    'TITAN',
    'Edge',
    '₹18,000',
    'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=800',
    'Minimal everyday watch style.',
  ),
  Watch(
    'CITIZEN',
    'Eco-Drive',
    '₹28,000',
    'https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=800',
    'Elegant everyday watch style.',
  ),
  Watch(
    'TIMEX',
    'Expedition',
    '₹7,000',
    'https://images.unsplash.com/photo-1547996160-81dfa63595aa?w=800',
    'Outdoor-inspired watch style.',
  ),
  Watch(
    'ORIENT',
    'Bambino',
    '₹25,000',
    'https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=800',
    'Dress-watch style.',
  ),
  Watch(
    'TOMMY HILFIGER',
    'Classic',
    '₹12,000',
    'https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=800',
    'Smart casual watch style.',
  ),
  Watch(
    'EMPORIO ARMANI',
    'Chronograph',
    '₹25,000',
    'https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?w=800',
    'Fashion chronograph style.',
  ),
];

// MAIN APP

class FalconTimes extends StatelessWidget {
  const FalconTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FALCON TIMES',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: black,
        colorScheme: const ColorScheme.dark(primary: gold, secondary: gold),
        appBarTheme: const AppBarTheme(
          backgroundColor: black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: cardColor,
          labelStyle: const TextStyle(color: gold),
          hintStyle: const TextStyle(color: Colors.white54),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: gold),
          ),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}

// COMMON WATCH IMAGE

class WatchPhoto extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const WatchPhoto({super.key, required this.url, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;

        return const Center(child: CircularProgressIndicator(color: gold));
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Icon(Icons.watch, color: gold, size: 65));
      },
    );
  }
}

// WELCOME PAGE

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const WatchPhoto(
            url: 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=1400',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.25),
                  Colors.black.withOpacity(0.95),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'F A L C O N\nT I M E S',
                    style: TextStyle(
                      color: gold,
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'TIMELESS LUXURY. DISTINCTIVE STYLE.',
                    style: TextStyle(color: Colors.white, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gold,
                        foregroundColor: black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ShopPage()),
                        );
                      },
                      child: const Text(
                        'EXPLORE COLLECTION',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// WATCH COLLECTION PAGE

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = watches.where((watch) {
      return watch.brand.toLowerCase().contains(query.toLowerCase()) ||
          watch.model.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FALCON TIMES',
          style: TextStyle(
            color: gold,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'THE WATCH COLLECTION',
              style: TextStyle(
                color: gold,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              'Find your signature timepiece.',
              style: TextStyle(color: Colors.white60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search watches...',
                prefixIcon: const Icon(Icons.search, color: gold),
                suffixIcon: query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: gold),
                        onPressed: () {
                          setState(() {
                            query = '';
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: filtered.isEmpty
                ? const Center(
                    child: Text(
                      'No watches found.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filtered.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 230,
                        ),
                    itemBuilder: (context, index) {
                      final watch = filtered[index];

                      return InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsPage(watch: watch),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: gold.withOpacity(0.35)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  color: imageBackground,
                                  padding: const EdgeInsets.all(7),
                                  child: WatchPhoto(url: watch.image),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  10,
                                  8,
                                  10,
                                  10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      watch.brand,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: gold,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      watch.model,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      watch.price,
                                      style: const TextStyle(
                                        color: gold,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// WATCH DETAILS PAGE

class DetailsPage extends StatelessWidget {
  final Watch watch;

  const DetailsPage({super.key, required this.watch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(watch.brand, style: const TextStyle(color: gold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                color: imageBackground,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.all(12),
              child: WatchPhoto(url: watch.image),
            ),
            const SizedBox(height: 24),
            Text(
              watch.brand,
              style: const TextStyle(
                color: gold,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              watch.model,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              watch.price,
              style: const TextStyle(
                color: gold,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: gold),
            const SizedBox(height: 12),
            Text(
              watch.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 28),

            // ORDER BUTTON
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: gold,
                  foregroundColor: black,
                ),
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text(
                  'ORDER NOW',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutPage(watch: watch),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: gold,
                  side: const BorderSide(color: gold),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('BACK TO COLLECTION'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CHECKOUT PAGE

class CheckoutPage extends StatefulWidget {
  final Watch watch;

  const CheckoutPage({super.key, required this.watch});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final pinController = TextEditingController();

  String paymentMethod = 'Cash on Delivery';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    pinController.dispose();
    super.dispose();
  }

  String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || !RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? validatePin(String? value) {
    if (value == null || !RegExp(r'^[0-9]{6}$').hasMatch(value.trim())) {
      return 'Enter a valid 6-digit PIN code';
    }
    return null;
  }

  Widget buildField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(labelText: label),
        validator: validator ?? requiredField,
      ),
    );
  }

  void confirmOrder() {
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: cardColor,
        title: const Text('Order Summary', style: TextStyle(color: gold)),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${widget.watch.brand} ${widget.watch.model}'),
              Text('Price: ${widget.watch.price}'),
              const Divider(color: gold),
              Text('Buyer: ${nameController.text.trim()}'),
              Text('Email: ${emailController.text.trim()}'),
              Text('Phone: ${phoneController.text.trim()}'),
              Text('Address: ${addressController.text.trim()}'),
              Text('City: ${cityController.text.trim()}'),
              Text('PIN code: ${pinController.text.trim()}'),
              const SizedBox(height: 8),
              Text('Payment: $paymentMethod'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('CANCEL', style: TextStyle(color: gold)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: gold,
              foregroundColor: black,
            ),
            onPressed: () {
              Navigator.pop(dialogContext);

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (successContext) => AlertDialog(
                  backgroundColor: cardColor,
                  title: const Text(
                    'Order Placed!',
                    style: TextStyle(color: gold),
                  ),
                  content: const Text(
                    'Thank you for shopping with FALCON TIMES.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(successContext);
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text('DONE', style: TextStyle(color: gold)),
                    ),
                  ],
                ),
              );
            },
            child: const Text('CONFIRM ORDER'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHECKOUT',
          style: TextStyle(color: gold, letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BUYER DETAILS',
                style: TextStyle(
                  color: gold,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              buildField('Full Name', nameController),

              buildField(
                'Email Address',
                emailController,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),

              buildField(
                'Phone Number',
                phoneController,
                keyboardType: TextInputType.phone,
                validator: validatePhone,
              ),

              buildField('Delivery Address', addressController),

              buildField('City', cityController),

              buildField(
                'PIN Code',
                pinController,
                keyboardType: TextInputType.number,
                validator: validatePin,
              ),

              const SizedBox(height: 15),

              const Text(
                'PAYMENT METHOD',
                style: TextStyle(
                  color: gold,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    RadioListTile<String>(
                      title: const Text('Cash on Delivery'),
                      value: 'Cash on Delivery',
                      groupValue: paymentMethod,
                      activeColor: gold,
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          paymentMethod = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('UPI Payment'),
                      value: 'UPI Payment',
                      groupValue: paymentMethod,
                      activeColor: gold,
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          paymentMethod = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Credit / Debit Card'),
                      value: 'Credit / Debit Card',
                      groupValue: paymentMethod,
                      activeColor: gold,
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          paymentMethod = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: gold.withOpacity(0.4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ORDER DETAILS',
                      style: TextStyle(
                        color: gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text('${widget.watch.brand} ${widget.watch.model}'),
                    const SizedBox(height: 8),
                    Text(
                      'Total: ${widget.watch.price}',
                      style: const TextStyle(
                        color: gold,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gold,
                    foregroundColor: black,
                  ),
                  onPressed: confirmOrder,
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text(
                    'PLACE ORDER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: gold,
                    side: const BorderSide(color: gold),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('BACK TO WATCH'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
