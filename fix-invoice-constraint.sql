-- THIS SCRIPT FIXES THE INVOICE NUMBER DUPLICATION ERROR
-- It allows different users to have the same invoice number sequence (e.g. INV-2026-001)
-- without clashing with each other.

-- 1. Remove the old global unique constraint
ALTER TABLE invoices DROP CONSTRAINT IF EXISTS invoices_invoice_number_key;

-- 2. Add a new unique constraint that is scoped to each user
-- This means (user_id + invoice_number) must be unique, not just invoice_number
ALTER TABLE invoices ADD CONSTRAINT invoices_user_id_invoice_number_key UNIQUE (user_id, invoice_number);
