-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 4386820 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint ~= 35151 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 557) ~= 901120 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 561) ~= 116224 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 581) ~= 3221225536 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 76)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 76)
if l_0_1 ~= 552163327 then
  return mp.CLEAN
end
return mp.INFECTED
