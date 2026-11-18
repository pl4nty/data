-- Threat: PUA:Win32/HotSpotNewspaper
-- Type: 10
-- MpAttributes: (PUA:Block:Softcnapp | PUA:ML:Blocked:Softcnapp) & !PUA:Exception

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ProductName
if l_0_1 and string.find(l_0_1, "\231\131\173\231\130\185\230\150\176\233\151\187", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
