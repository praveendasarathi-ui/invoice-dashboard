-- RUN THIS TO UPDATE YOUR COMPANY SETTINGS TO THE NEW BRANDING
-- This will update any existing records that still have the old names.

UPDATE company_settings 
SET 
  company_name = 'Centurianit',
  email = 'info@centurianit.co',
  website = 'www.centurianit.co'
WHERE company_name IN ('Centubill', 'Centruriant') 
   OR email IN ('info@centubill.com', 'info@centruriant.com')
   OR website IN ('centubill.com', 'centruriant.com');
