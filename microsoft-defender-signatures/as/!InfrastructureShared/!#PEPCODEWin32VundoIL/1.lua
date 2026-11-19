-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Win32/Vundo.IL
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if epcode[1] ~= 80 then
  return mp.CLEAN
end
if epcode[2] ~= 235 then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 268435456 then
  return mp.CLEAN
end
if peattributes.hasexports ~= false then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].Size == 0 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
