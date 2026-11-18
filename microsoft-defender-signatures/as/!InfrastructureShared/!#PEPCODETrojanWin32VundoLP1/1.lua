-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.LP.1
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports == true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.SizeOfHeaders ~= 1024 then
  return mp.CLEAN
end
if pehdr.FileAlignment ~= 512 then
  return mp.CLEAN
end
if pehdr.Subsystem ~= 2 then
  return mp.CLEAN
end
return mp.INFECTED
