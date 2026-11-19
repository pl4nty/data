-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:TrojanDownloader:Win32/Cutwail.AK
-- Type: 8

if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if peattributes.packed ~= false then
  return mp.CLEAN
end
if peattributes.epinfirstsect == true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size ~= 0 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 1920168494 then
  return mp.CLEAN
end
if epcode[1] ~= 96 then
  return mp.CLEAN
end
return mp.INFECTED
