-- Threat: !InfrastructureShared
-- Name: DevilsTongue
-- Type: 15

if Remediation.Threat.Active then
  Remediation.DefaultSpecialRegistry("HKLM\\Software\\Classes\\CLSID\\{CF4CC405-E2C5-4DDD-B3CE-5E7582D8C9FA}")
  Remediation.DefaultSpecialRegistry("HKCU\\Software\\Classes\\CLSID\\{7C857801-7381-11CF-884D-00AA004B2E24}")
  Remediation.DefaultSpecialRegistry("HKLM\\Software\\Classes\\CLSID\\{7998DC37-D3FE-487C-A60A-7701FCC70CC6}")
end
