-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 819200 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 649) ~= 1936487470 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 685) ~= 3221225536 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 23)
mp.writeu_u32(l_0_0, 17, 0)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 23)
if l_0_1 ~= 1897054316 then
  return mp.CLEAN
end
return mp.INFECTED
