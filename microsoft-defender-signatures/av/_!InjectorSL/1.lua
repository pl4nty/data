-- Threat: \xcc!Injector.SL
-- Type: 8

if epcode[1] ~= 232 then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData < 69632 then
  return mp.CLEAN
end
if pehdr.MajorLinkerVersion ~= 8 then
  return mp.CLEAN
end
if pehdr.MinorLinkerVersion ~= 0 then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 4 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[3].Size then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[1].PointerToRawData, 34)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 34)
if l_0_1 ~= 2079317048 then
  return mp.CLEAN
end
return mp.INFECTED
