-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:PWS:Win32/Zbot.BW
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.lastscn_falign ~= true then
  return mp.CLEAN
end
if peattributes.epscn_writable == false then
  return mp.CLEAN
end
if peattributes.hasappendeddata ~= true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 1920168494 then
  return mp.CLEAN
end
if epcode[2] ~= 139 then
  return mp.CLEAN
end
return mp.INFECTED
