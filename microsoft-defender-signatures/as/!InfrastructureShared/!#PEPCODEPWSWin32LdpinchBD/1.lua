-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:PWS:Win32/Ldpinch.BD
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
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.BaseOfCode ~= 4096 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 2 then
  return mp.CLEAN
end
return mp.INFECTED
