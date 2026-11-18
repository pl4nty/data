-- Threat: Trojan:O97M/Vakslodak.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_OLE_FILE & LUA:FileSizeLE10000.A

local l_0_0 = mp.getfilesize()
if l_0_0 < 16384 or 65536 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "\\xlstart\\office_.xls", 1, true) == nil then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = tostring(mp.readfooter(0, 4096))
if l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_2, "Module=Majoduck_SK_1", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
