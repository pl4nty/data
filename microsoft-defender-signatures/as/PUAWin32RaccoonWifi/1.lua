-- Threat: PUA:Win32/RaccoonWifi
-- Type: 10
-- MpAttributes: (PUA:Block:Softcnapp | PUA:ML:Blocked:Softcnapp) & !PUA:Exception

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ProductName
if l_0_1 and string.find(l_0_1, "\229\176\143\230\181\163\231\134\138WiFi", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
