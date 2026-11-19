-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Renos.G
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 6 then
  return mp.CLEAN
end
return mp.INFECTED
