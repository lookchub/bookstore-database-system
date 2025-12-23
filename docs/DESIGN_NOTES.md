# Design Evolution Notes

## Original Design (2024)

The ER diagrams in `docs/` represent the initial database design completed as part of university coursework with a team of 5 members. The design was based on business requirements analysis for Naiin Bookstore operations.

## Implementation Refinements

During SQL implementation (2025), the following improvements were made to address design flaws and align with database best practices:

---

### 1. Relationship Corrections (Many-to-Many)

**Issue**: Several relationships were incorrectly modeled as one-to-many when they should be many-to-many.

#### 1.1 Book ↔ Author Relationship
- **Original**: Direct foreign key `AUTHOR_ID` in `BOOK` table (1:M)
- **Problem**: A book can have multiple authors (co-authors), and an author can write multiple books
- **Fixed**: Created junction table `BOOK_AUTHOR` to properly represent M:N relationship
- **Changes**:
  - Added `BOOK_AUTHOR` table with composite primary key
  - Removed `AUTHOR_ID` from `BOOK` table
  - Removed `BOOK_ID` from `AUTHOR` table

#### 1.2 Book ↔ Genre Relationship
- **Original**: Direct foreign key `GENRE_ID` in `BOOK` table (1:M)
- **Problem**: A book can belong to multiple genres, and each genre contains multiple books
- **Fixed**: Created junction table `BOOK_GENRE` to properly represent M:N relationship
- **Changes**:
  - Added `BOOK_GENRE` table with composite primary key
  - Removed `GENRE_ID` from `BOOK` table

#### 1.3 Book ↔ Orders Relationship
- **Original**: Direct foreign key `BOOK_ID` in `ORDERS` table (1:M)
- **Problem**: An order can contain multiple books, and each book can be ordered multiple times across different orders
- **Fixed**: Created junction table `ORDER_ITEM` to properly represent M:N relationship
- **Changes**:
  - Added `ORDER_ITEM` table with `ORDER_ID`, `BOOK_ID`, and `QUANTITY`
  - Removed `BOOK_ID` and `ORDER_QUANTITY` from `ORDERS` table
  - Properly tracks quantity per book per order

---

### 2. Derived Data Removal

**Issue**: Storing derived data that can be computed from existing fields.

- **Removed**: `EMP_AGE` from `EMPLOYEE` table
- **Removed**: `CUS_AGE` from `CUSTOMER` table
- **Reason**: Age can be calculated from `DATE_OF_BIRTH` field at query time
- **Benefit**: Eliminates need to update age annually; single source of truth

---

### 3. Redundant Date Field Cleanup

**Issue**: Original design decomposed dates into separate `MONTH` and `YEAR` fields alongside complete `DATE` fields, causing redundancy.

**Tables affected**: `EMPLOYEE`, `CUSTOMER`, `MEMBERSHIP_CARD`, `PROMOTION`, `ORDERS`, `RENEWAL`, `RECEIPT`

**Changes**:
- Removed redundant `*_BMONTH`, `*_BYEAR` fields
- Kept only complete `DATE` type fields (e.g., `EMP_BDAY`)

---

### 4. Data Integrity Issues

#### 4.1 Duplicate Column
- **Issue**: `PUBLISHER` table had duplicate `PBS_POSTCODE` column
- **Fixed**: Removed duplicate column

#### 4.2 Orphaned Foreign Keys
- **Issue**: `PUBLISHER` table incorrectly contained `AUTHOR_ID` and `BOOK_ID`
- **Fixed**: Removed these foreign keys

---

### 5. Naming Consistency

**Issue**: Inconsistent naming conventions across tables reduced code readability.

**Changes**:
- Renamed `EMP_ID` → `EMPLOYEE_ID`
- Renamed `PURCHASE_ORDER` → `ORDERS`

---

### 6. Unnecessary Fields

**Issue**: Some fields had no clear business purpose and cluttered the schema.

**Removed**:
- `EMP_EMAIL` from `BRANCH` table

---

### 7. Missing Business Logic Fields

**Issue**: `POINT` table lacked essential information for loyalty program functionality.

**Added**:
- `POINT_AMOUNT` field to `POINT` table
- **Reason**: System needs to track point values spent per transaction

---


## Why Diagrams Weren't Updated

The original ER diagrams in `docs/` are preserved as:
1. **Academic deliverables** - Part of graded coursework submission
2. **Team collaboration artifacts** - Represents group effort and cannot be unilaterally modified

The SQL implementation in `schema/` represents the refined, production-ready version incorporating lessons learned and best practices.
