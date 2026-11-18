-- Threat: PUA:Win32/DandelionWifi
-- Type: 10
-- MpAttributes: (PUA:Block:Softcnapp | PUA:ML:Blocked:Softcnapp) & !PUA:Exception

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ProductName
if l_0_1 and string.find(l_0_1, "\232\146\178\229\133\172\232\139\177WiFi", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
