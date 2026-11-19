-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:TrojanDownloader:Win32/Renos.gen!AR
-- Type: 8

if peattributes.no_relocs ~= true then
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
if pehdr.DataDirectory[1].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].RVA ~= 0 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[3].Size then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 1920168494 then
  return mp.CLEAN
end
return mp.INFECTED
