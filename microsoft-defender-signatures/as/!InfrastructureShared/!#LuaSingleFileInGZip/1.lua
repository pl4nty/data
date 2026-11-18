-- Threat: !InfrastructureShared
-- Name: !#Lua:SingleFileInGZip
-- Type: 12

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
if l_0_0 < 256 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 1) ~= 35615 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 2) ~= 2187 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u16(headerpage, 10)
if 31245 < l_0_1 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:SingleFileInGZip")
return mp.CLEAN
