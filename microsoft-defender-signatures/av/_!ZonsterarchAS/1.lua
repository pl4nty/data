-- Threat: \xac!Zonsterarch.AS
-- Type: 8

if peattributes.hasappendeddata ~= true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
local l_0_1 = mp.getfilesize()
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.readfile(l_0_0, 76)
local l_0_3 = mp.crc32(-1, l_0_2, 1, 11)
if l_0_3 ~= 1339394596 then
  return mp.CLEAN
end
mp.writeu_u8(l_0_2, 25, l_0_2:byte(26))
mp.writeu_u8(l_0_2, 27, l_0_2:byte(26))
mp.writeu_u8(l_0_2, 28, l_0_2:byte(26))
local l_0_4 = mp.bitxor(mp.readu_u32(l_0_2, 25), mp.readu_u32(l_0_2, 45))
if l_0_4 ~= 1918975008 then
  return mp.CLEAN
end
local l_0_5 = mp.bitxor(mp.readu_u32(l_0_2, 25), mp.readu_u32(l_0_2, 49))
if l_0_5 ~= 1986619491 then
  return mp.CLEAN
end
local l_0_6 = mp.bitxor(mp.readu_u32(l_0_2, 25), mp.readu_u32(l_0_2, 53))
if l_0_6 ~= 1701076837 then
  return mp.CLEAN
end
return mp.INFECTED
