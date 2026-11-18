-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 1609728 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint ~= 4096 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 593) ~= 569344 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 597) ~= 307200 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 621) ~= 3221225536 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 43)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 43)
if l_0_1 ~= 3194562208 then
  return mp.CLEAN
end
return mp.INFECTED
