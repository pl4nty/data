-- Threat: \x84!Lanfiltrator.C
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.epoutofimage ~= true then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint ~= 428288 then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData ~= 416256 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 8 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[1].PointerToRawData + 404504, 1024)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 1024)
if l_0_1 ~= 2928032113 then
  return mp.CLEAN
end
return mp.INFECTED
