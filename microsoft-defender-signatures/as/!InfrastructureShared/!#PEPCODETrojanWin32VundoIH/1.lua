-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.IH
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= false then
  return mp.CLEAN
end
if epcode[1] ~= 106 then
  return mp.CLEAN
end
if epcode[2] ~= 40 then
  return mp.CLEAN
end
if epcode[3] ~= 104 then
  return mp.CLEAN
end
if epcode[8] ~= 232 then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 268435456 then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData ~= 512 then
  return mp.CLEAN
end
if pesecs[1].VirtualAddress ~= 4096 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData ~= 8704 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 6 then
  return mp.CLEAN
end
return mp.INFECTED
