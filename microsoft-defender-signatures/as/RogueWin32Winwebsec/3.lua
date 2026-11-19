-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 1363968 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 553) ~= 1920168494 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 589) ~= 3221225536 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 11)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 11)
if l_0_1 ~= 3167747973 then
  return mp.CLEAN
end
return mp.INFECTED
