-- Threat: \x84!Bifrose.HZ
-- Type: 8

if pehdr.NumberOfSections ~= 2 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 1) ~= 2213317461 then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 5) ~= 4283843820 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint) - 25672, 17408)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 17408)
if l_0_1 ~= 2273450232 then
  return mp.CLEAN
end
return mp.INFECTED
