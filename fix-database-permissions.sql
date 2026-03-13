-- Fix RLS policies for all tables to allow full access
-- This is for an internal invoice management tool

BEGIN;

-- Drop existing restrictive policies
DROP POLICY IF EXISTS "Enable read access for authenticated users" ON clients;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON clients;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON clients;
DROP POLICY IF EXISTS "Enable delete for authenticated users" ON clients;

DROP POLICY IF EXISTS "Enable read access for authenticated users" ON invoices;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON invoices;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON invoices;
DROP POLICY IF EXISTS "Enable delete for authenticated users" ON invoices;

DROP POLICY IF EXISTS "Enable read access for authenticated users" ON invoice_items;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON invoice_items;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON invoice_items;
DROP POLICY IF EXISTS "Enable delete for authenticated users" ON invoice_items;

DROP POLICY IF EXISTS "Enable read access for authenticated users" ON company_settings;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON company_settings;
DROP POLICY IF EXISTS "Enable update for authenticated users" ON company_settings;

-- Enable RLS on all tables
ALTER TABLE clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE invoices ENABLE ROW LEVEL SECURITY;
ALTER TABLE invoice_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE company_settings ENABLE ROW LEVEL SECURITY;

-- Create permissive policies for all operations (internal tool - full access)

-- Clients table policies
CREATE POLICY "Allow all operations on clients"
ON clients
FOR ALL
TO authenticated, anon
USING (true)
WITH CHECK (true);

-- Invoices table policies
CREATE POLICY "Allow all operations on invoices"
ON invoices
FOR ALL
TO authenticated, anon
USING (true)
WITH CHECK (true);

-- Invoice items table policies
CREATE POLICY "Allow all operations on invoice_items"
ON invoice_items
FOR ALL
TO authenticated, anon
USING (true)
WITH CHECK (true);

-- Company settings table policies
CREATE POLICY "Allow all operations on company_settings"
ON company_settings
FOR ALL
TO authenticated, anon
USING (true)
WITH CHECK (true);

-- Refresh PostgREST schema cache
SELECT apply_postgrest_permissions();

COMMIT;

-- Verify policies
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  cmd
FROM pg_policies 
WHERE schemaname = 'public'
ORDER BY tablename, policyname;
