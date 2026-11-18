-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 4390912 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint) + 101, 31)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 31)
if l_0_1 ~= 4206433989 then
  return mp.CLEAN
end
return mp.INFECTED
