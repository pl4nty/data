-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.gen!AC
-- Type: 8

if peattributes.hasexports == true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 4 then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size ~= 0 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 0 then
  return mp.CLEAN
end
if epcode[1] ~= 80 then
  return mp.CLEAN
end
if epcode[2] ~= 235 then
  return mp.CLEAN
end
return mp.INFECTED
