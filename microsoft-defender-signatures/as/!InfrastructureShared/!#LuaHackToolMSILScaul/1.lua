-- Threat: !InfrastructureShared
-- Name: !#Lua:HackTool:MSIL/Scaul
-- Type: 10
-- MpAttributes: HSTR:MSIL/Confuser

if not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0.ProductName, "MacaulyMoDzs Private Skype Tool", 1, true) ~= nil or string.find(l_0_0.ProductName, "MacaulyMoDzs_Final_Skype_Tool", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
