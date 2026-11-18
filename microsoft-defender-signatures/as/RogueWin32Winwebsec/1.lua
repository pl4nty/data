-- Threat: Rogue:Win32/Winwebsec
-- Type: 8

if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 942080 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 273) ~= 81920 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(1024, 32)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 32)
if l_0_1 ~= 1903186665 then
  return mp.CLEAN
end
return mp.INFECTED
