-- Threat: \xac!Alureon.FD!internal
-- Type: 8

if pehdr.NumberOfSections ~= 7 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= false then
  return mp.CLEAN
end
if peattributes.epscn_valign == true then
  return mp.CLEAN
end
if pehdr.DataDirectory[7].RVA < 24576 then
  return mp.CLEAN
end
if pehdr.DataDirectory[7].Size ~= 28 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 577) ~= 1835365422 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 581) ~= 112 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].PointerToRawData < 98304 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].PointerToRawData > 200704 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(mp.readu_u32(headerpage, 597) + mp.readu_u32(headerpage, 593) - 8192, 8192)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 8192)
if l_0_1 ~= 3673850997 then
  return mp.CLEAN
end
return mp.INFECTED
