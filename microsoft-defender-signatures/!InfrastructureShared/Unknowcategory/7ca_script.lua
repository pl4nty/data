-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7ca_luac 

-- params : ...
-- function num : 0
if (Remediation.Threat).Active then
  (Remediation.DefaultSpecialRegistry)("HKLM\\Software\\Classes\\CLSID\\{CF4CC405-E2C5-4DDD-B3CE-5E7582D8C9FA}")
  ;
  (Remediation.DefaultSpecialRegistry)("HKCU\\Software\\Classes\\CLSID\\{7C857801-7381-11CF-884D-00AA004B2E24}")
  ;
  (Remediation.DefaultSpecialRegistry)("HKLM\\Software\\Classes\\CLSID\\{7998DC37-D3FE-487C-A60A-7701FCC70CC6}")
end

