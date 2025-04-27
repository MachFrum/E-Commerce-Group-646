# 🌟 **EcommerceDB Schema: Your Ultimate Guide to a Rock-Solid E-Commerce Database** 🛒  

## **Overview**  
Welcome to the **EcommerceDB Schema** repository! 🎉 This isn’t just *any* database—it’s a **fully-relational powerhouse** built to handle everything from product variations to customer orders, all while keeping data squeaky-clean and lightning-fast. ⚡ Dive into the SQL magic behind your next favorite online shopping experience!  

---

## **✨ Relational Design Principles**  
Our schema isn’t just smart—it’s *genius*. Here’s why:  
- **🚀 Normalization**: Kiss redundancy goodbye! Each concept (products, customers, orders) gets its own VIP table. No duplicates, no drama.  
- **🔑 Foreign Keys & Constraints**: Data relationships? Locked down tighter than a celebrity’s diary. Cascade rules keep everything in sync, even when parents get deleted. 💔  
- **⚡ Indexes**: Speedy lookups for days! Columns like `name`, `status`, and `created_at` get turbocharged.  
- **🌳 Hierarchies**: Self-referencing tables (`product_category`, `attribute_category`) handle multi-level categories like a family tree. 🌲  

---

## **💎 Entity & Table Deep-Dive**  

### **Core Entities**  
- **🛍️ `brand`**: Store brand swag—names, logos, websites, even their home country!  
- **📂 `product_category`**: Organize products into nested categories (think "Electronics → Phones → Accessories").
- 🎨 `color` + **📏 `size_category`/`size_option`**: Manage variants like a pro. Sizes group into categories (e.g., "Shoe Sizes: US 8, EU 41").  
- **🏷️ `attribute_category`/`attribute_type`**: Tag products with custom traits ("Material: Silk", "Weight: 500g"). Sub-categories? We’ve got those too!  

### **Products & Variations 🧩**  
- **📦 `product`**: The star of the show! Linked to a brand and category.  
- **🖼️ `product_image`**: Show off multiple angles + flag a primary image. *Cue the paparazzi.* 📸  
- **🔧 `product_attribute`**: Attach custom specs (e.g., "Waterproof: Yes").  
- **✨ `product_variation`**: Mix colors + sizes into unique SKUs with their own price, stock, and status.  
- **🏷️ `product_item`**: Track physical items—barcodes, weights, units. Because logistics matter! 📦  

### **Customers & Orders 👥**  
- **👤 `customer`**: Names, emails, phones, and password hashes (safety first! 🔒).  
- **🏠 `address`**: Store billing/shipping addresses + mark defaults.  
- **📦 `orders`**: Track purchases like a boss—link customers, addresses, statuses, and $$ details (subtotal, tax, discounts).  
- **🛒 `order_item`**: Line items for each order, tied to variations + quantities.  
- **💸 `payment`**: Record payment attempts, transaction IDs, and success/fail statuses.  
- **🚚 `shipping`**: Shipment tracking with carriers, methods, costs, and *”Where’s my package?!”* delivery dates. 📅  

---

## **🎁 Bonus Tables**  
Because why stop at “good enough”?  
1. **🎉 `promotion`**: Run discounts (%, fixed), set validity windows, and cap usage. Cha-ching! 💰  
2. **⭐ `review`**: Let customers rant or rave! One review per order, with moderation flags to keep things classy. 🕶️  

---

## **🔍 Relationship Diagram (ERD)**  
Peek at the snazzy ERD diagram 🖼️ for a visual tour of table relationships—one-to-many, self-referencing hierarchies, and all the SQL eye candy.  

---

**Pro Tip:** All tables come with built-in timekeepers ⏰ (`created_at`, `updated_at`). Cascade rules ensure no orphaned data—because every child deserves a parent. 👨👩👧  

SQL files live in the `schema/` directory. Go forth and query!  

---  
*Crafted with ❤️ by Group 646 — your e-commerce database heroes! 👨💻👩💻*  

---  
