-- Threat: \xac!Zonsterarch.AT
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
local l_0_0 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData, 11)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 11)
if l_0_1 ~= 2380235146 then
  return mp.CLEAN
end
local l_0_2 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData, 76)
mp.writeu_u8(l_0_2, 25, l_0_2:byte(26))
mp.writeu_u8(l_0_2, 27, l_0_2:byte(26))
mp.writeu_u8(l_0_2, 28, l_0_2:byte(26))
local l_0_3 = mp.bitxor(mp.readu_u32(l_0_2, 25), mp.readu_u32(l_0_2, 72))
if l_0_3 ~= 1684627301 then
  return mp.CLEAN
end
return mp.INFECTED
