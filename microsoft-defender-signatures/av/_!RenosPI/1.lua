-- Threat: \x88!Renos.PI
-- Type: 8

if pehdr.NumberOfSections ~= 6 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 102400 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 505) ~= 1162104643 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 541) ~= 3758096416 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 11)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 11)
if l_0_1 ~= 2687456419 then
  return mp.CLEAN
end
return mp.INFECTED
