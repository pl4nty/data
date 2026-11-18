-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspicousExcelFile
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_OLE_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 16385 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0 - 12288, 4096)
local l_0_2 = tostring(l_0_1)
if string.find(l_0_2, "\207\238\235\252\231\238\226\224\242\229\235\252 Win", 1, true) ~= nil then
  mp.set_mpattribute("Lua:SuspiciousOfficeFileInfS101")
  return mp.CLEAN
end
if string.find(l_0_2, "Micha\000\000\000\030\000\000\000\016\000\000\000Micr", 1, true) ~= nil then
  mp.set_mpattribute("Lua:SuspiciousOfficeFileInfS102")
  return mp.CLEAN
end
return mp.CLEAN
