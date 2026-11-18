-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 1953792 then
  return mp.CLEAN
end
if pesecs[1].VirtualSize ~= 933888 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 593) ~= 188416 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 597) ~= 942080 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 621) ~= 3221225536 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 108)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 108)
if l_0_1 ~= 1591061623 then
  return mp.CLEAN
end
return mp.INFECTED
