-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Virus:Win32/Mesoum
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pesecs[1].VirtualSize <= 12288 then
  return mp.CLEAN
end
if pesecs[1].VirtualSize >= 81920 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[1].VirtualSize + pesecs[1].PointerToRawData, 4)
if mp.readu_u32(l_0_0, 1) == 0 then
  return mp.CLEAN
end
return mp.INFECTED
