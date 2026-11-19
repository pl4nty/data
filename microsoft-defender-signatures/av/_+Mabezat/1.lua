-- Threat: \xb0+Mabezat
-- Type: 8

if pesecs[1].VirtualSize ~= 53594 then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData ~= 53760 then
  return mp.CLEAN
end
if pesecs[1].PointerToRawData ~= 1024 then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 3 then
  return mp.CLEAN
end
if pehdr.NumberOfSections >= 6 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(54784, 128)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 128)
if l_0_1 ~= 2607511169 then
  return mp.CLEAN
end
return mp.INFECTED
