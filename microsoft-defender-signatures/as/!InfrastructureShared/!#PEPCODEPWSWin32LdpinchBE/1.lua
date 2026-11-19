-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:PWS:Win32/Ldpinch.BE
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
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 2 then
  return mp.CLEAN
end
return mp.INFECTED
