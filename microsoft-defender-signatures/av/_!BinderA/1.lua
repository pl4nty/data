-- Threat: \xcc!Binder.A
-- Type: 8

if pesecs[1].SizeOfRawData ~= 384 then
  return mp.CLEAN
end
if pesecs[1].PointerToRawData ~= 640 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 1) ~= 1793887061 then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 5) ~= 45639680 then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 9) ~= 174719040 then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 13) ~= 1441267818 then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 17) ~= 1560281088 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pesecs[1].VirtualAddress), 277)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 32)
if l_0_1 ~= 741603429 then
  return mp.CLEAN
end
local l_0_2 = mp.crc32(-1, l_0_0, 1, 277)
if l_0_2 ~= 1117866516 then
  return mp.CLEAN
end
return mp.INFECTED
