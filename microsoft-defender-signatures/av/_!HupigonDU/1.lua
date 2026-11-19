-- Threat: \x84!Hupigon.DU
-- Type: 8

if pehdr.Characteristics ~= 33166 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 778240 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].RVA ~= 729088 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(1561, 400)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 400)
if l_0_1 ~= 1910764323 then
  return mp.CLEAN
end
return mp.INFECTED
