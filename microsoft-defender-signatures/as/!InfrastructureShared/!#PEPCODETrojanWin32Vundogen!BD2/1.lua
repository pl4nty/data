-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.gen!BD.2
-- Type: 8

if peattributes.hasexports == true then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 6 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 1633972270 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if epcode[1] ~= 233 then
  return mp.CLEAN
end
if epcode[4] ~= 255 then
  return mp.CLEAN
end
if epcode[5] ~= 255 then
  return mp.CLEAN
end
if pesecs[1].PointerToRawData ~= 1024 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[1].PointerToRawData, 80)
if l_0_0:byte(1) ~= 85 then
  return mp.CLEAN
end
if l_0_0:byte(54) ~= 80 then
  return mp.CLEAN
end
if l_0_0:byte(79) ~= 85 then
  return mp.CLEAN
end
return mp.INFECTED
