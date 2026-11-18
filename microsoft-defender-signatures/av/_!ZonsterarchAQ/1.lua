-- Threat: \xac!Zonsterarch.AQ
-- Type: 8

if peattributes.hasappendeddata ~= true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= false then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData, 76)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 11)
if l_0_1 ~= 1339394596 then
  return mp.CLEAN
end
mp.writeu_u8(l_0_0, 25, l_0_0:byte(26))
mp.writeu_u8(l_0_0, 27, l_0_0:byte(26))
mp.writeu_u8(l_0_0, 28, l_0_0:byte(26))
local l_0_2 = mp.bitxor(mp.readu_u32(l_0_0, 25), mp.readu_u32(l_0_0, 41))
if l_0_2 ~= 1631338087 then
  return mp.CLEAN
end
local l_0_3 = mp.bitxor(mp.readu_u32(l_0_0, 25), mp.readu_u32(l_0_0, 45))
if l_0_3 ~= 1768448882 then
  return mp.CLEAN
end
local l_0_4 = mp.bitxor(mp.readu_u32(l_0_0, 25), mp.readu_u32(l_0_0, 49))
if l_0_4 ~= 1767859574 then
  return mp.CLEAN
end
return mp.INFECTED
