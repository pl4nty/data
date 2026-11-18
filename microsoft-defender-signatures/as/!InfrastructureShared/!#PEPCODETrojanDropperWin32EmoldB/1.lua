-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:TrojanDropper:Win32/Emold.B
-- Type: 8

if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].PointerToRawData ~= 512 then
  return mp.CLEAN
end
return mp.INFECTED
