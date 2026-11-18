-- Threat: \x84!Hupigon.DI
-- Type: 8

if pehdr.Characteristics ~= 33166 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 757760 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].RVA ~= 708608 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(1561, 409)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 409)
if l_0_1 ~= 3407018037 then
  return mp.CLEAN
end
return mp.INFECTED
