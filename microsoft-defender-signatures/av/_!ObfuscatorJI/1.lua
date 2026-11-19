-- Threat: \xcc!Obfuscator.JI
-- Type: 8

if pehdr.NumberOfSections <= 5 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 433) ~= 2048 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(mp.readu_u32(headerpage, 437), 1280)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 240)
if l_0_1 ~= 1584319641 then
  return mp.CLEAN
end
local l_0_2 = mp.crc32(-1, l_0_0, 273, 768)
if l_0_2 ~= 2930427897 then
  return mp.CLEAN
end
return mp.INFECTED
