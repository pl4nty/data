-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 4386816 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint) + 52, 42)
mp.writeu_u16(l_0_0, 19, 0)
mp.writeu_u16(l_0_0, 21, 0)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 42)
if l_0_1 ~= 1822140877 then
  return mp.CLEAN
end
return mp.INFECTED
