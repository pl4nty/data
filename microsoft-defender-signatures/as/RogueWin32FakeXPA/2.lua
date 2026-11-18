-- Threat: Rogue:Win32/FakeXPA
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.firstsectwritable ~= true then
  return mp.CLEAN
end
if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.MajorLinkerVersion ~= 2 then
  return mp.CLEAN
end
if pehdr.MinorLinkerVersion ~= 25 then
  return mp.CLEAN
end
if pehdr.Characteristics ~= 33167 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size <= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].Size ~= 24 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pehdr.NumberOfSections].PointerToRawData + 760, 776)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 776)
if l_0_1 ~= 2602889284 then
  return mp.CLEAN
end
return mp.INFECTED
