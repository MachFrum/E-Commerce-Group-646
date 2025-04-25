
# 🛍️ EcommerceDB – MySQL Database Schema

A robust and scalable relational database schema for an e-commerce platform. Designed and implemented by **Group 646**, this schema supports comprehensive catalog management, customer profiles, orders, payments, shipping, promotions, and reviews.

## 📦 Schema Overview

EcommerceDB is designed to meet the data requirements of modern e-commerce platforms, supporting:

- Product categorization and attributes
- Inventory and variations
- Customers and addresses
- Orders and order items
- Payments and shipping
- Promotions and product reviews

---

## 🗂️ Database Structure

### 🏷️ Brand
Stores information about product brands.
```sql
brand_id, name, description, logo_url, website, country_of_origin, created_at, updated_at
```

### 📁 Product Category
Supports nested product categories.
```sql
category_id, parent_category_id, name, description, image_url, is_active, created_at, updated_at
```

### 🎨 Color
Defines available colors and their hex codes.
```sql
color_id, name, hex_code, created_at, updated_at
```

### 📏 Size Category & Size Option
Supports complex size systems across categories.
```sql
size_category_id, name, description, created_at, updated_at
size_option_id, size_category_id, name, code, created_at, updated_at
```

### 🧩 Attribute Category & Type
Defines attribute taxonomy for product customization.
```sql
attribute_category_id, name, description
attribute_type_id, attribute_category_id, name, description
```

### 🛒 Product
Main product entity linked to brand and category.
```sql
product_id, category_id, brand_id, name, description, is_featured, is_active, created_at, updated_at
```

### 🖼️ Product Image
Handles primary and secondary product images.
```sql
image_id, product_id, image_url, alt_text, is_primary, display_order
```

### 🏷️ Product Attribute
Assigns attribute values to products.
```sql
product_attribute_id, product_id, attribute_type_id, value
```

### 🔄 Product Variation
Supports SKUs, pricing, color, and size.
```sql
variation_id, product_id, color_id, size_option_id, sku, price, sale_price, quantity_in_stock
```

### 🔖 Product Item
Handles barcoded inventory units.
```sql
item_id, variation_id, barcode, weight, weight_unit
```

---

## 👤 Customer & Address

### 👥 Customer
Holds personal and contact information.
```sql
customer_id, first_name, last_name, email, phone, password_hash
```

### 🏠 Address
Stores multiple billing/shipping addresses.
```sql
address_id, customer_id, address_line1, ..., country, is_default, address_type
```

---

## 📦 Orders & Payments

### 🧾 Orders
Tracks order lifecycle and totals.
```sql
order_id, customer_id, shipping_address_id, billing_address_id, order_status, payment_status, ...
```

### 📦 Order Item
Details of each item within an order.
```sql
order_item_id, order_id, product_variation_id, quantity, unit_price, subtotal
```

### 💳 Payment
Stores transaction records.
```sql
payment_id, order_id, transaction_id, amount, currency, status
```

### 🚚 Shipping
Tracks shipping info and delivery progress.
```sql
shipping_id, order_id, tracking_number, carrier, shipping_method, ...
```

---

## 🎁 Promotions & Reviews

### 💸 Promotion
Handles active discount campaigns.
```sql
promotion_id, name, discount_type, discount_value, start_date, end_date, ...
```

### ⭐ Review
Customer feedback linked to verified purchases.
```sql
review_id, product_id, customer_id, order_id, rating, comment, is_verified_purchase
```

---

## 🛠️ How to Use

1. Run the SQL script in a MySQL-compatible database.
2. Ensure correct privileges are set for your application user.
3. Extend or modify the schema as needed for your project.

---

## 📚 Credits

This database was designed and implemented by **Group 646** as part of a comprehensive e-commerce system architecture.

---

## 📄 License

Free.
