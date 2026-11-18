-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.gen!BC.2
-- Type: 8

if pesecs[pehdr.NumberOfSections].NameDW ~= 1633972270 then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= true then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.epscn_writable == false then
  return mp.CLEAN
end
if epcode[1] ~= 80 then
  return mp.CLEAN
end
if epcode[2] ~= 104 then
  return mp.CLEAN
end
if epcode[7] ~= 232 then
  return mp.CLEAN
end
if epcode[12] ~= 232 then
  return mp.CLEAN
end
if epcode[17] ~= 51 then
  return mp.CLEAN
end
if epcode[18] ~= 192 then
  return mp.CLEAN
end
if epcode[19] ~= 64 then
  return mp.CLEAN
end
return mp.INFECTED
