-- Threat: \xb0!Kala.A
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if mp.readu_u16(epcode, 1) ~= 11616 then
  return mp.CLEAN
end
if epcode[7] ~= 187 then
  return mp.CLEAN
end
if epcode[12] ~= 185 then
  return mp.CLEAN
end
local l_0_0 = mp.crc32(-1, epcode, 17, 19)
if l_0_0 ~= 1894062762 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(epcode, 13) - pehdr.ImageBase - pesecs[pehdr.NumberOfSections].VirtualAddress
if l_0_1 ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
