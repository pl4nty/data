-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VMMGROW_FOR_WINTRIM_BX
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= false then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[11].RVA ~= 0 then
  return mp.CLEAN
end
if peattributes.hasstandardentry ~= false then
  return mp.CLEAN
end
if peattributes.is_delphi ~= false then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if epcode[1] ~= 129 then
  return mp.CLEAN
end
if epcode[2] ~= 236 then
  return mp.CLEAN
end
if mp.readu_u16(epcode, 5) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u16(epcode, 3) < 768 then
  return mp.CLEAN
end
if pehdr.SizeOfImage < 512000 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
local l_0_0 = pehdr.SizeOfImage - pesecs[pevars.epsec].VirtualSize
if 126976 <= l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
