-- Threat: !InfrastructureShared
-- Name: !#Lua:PEEmbeddedAfterPng
-- Type: 12

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
if l_0_0 < 8192 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 1196314761 then
  return mp.CLEAN
end
local l_0_1 = mp.readfile(256, 256)
if string.find(l_0_1, "IEND", 1, true) ~= nil and string.find(l_0_1, "MZ", 1, true) ~= nil and string.find(l_0_1, "This program cannot be run in DOS mode", 1, true) ~= nil then
  mp.set_mpattribute("Lua:PEEmbeddedAfterPng")
end
return mp.CLEAN
