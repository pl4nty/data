-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VirTool:Win32/Obfuscator.CH
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_falign ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= true then
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
if pehdr.BaseOfCode ~= 4096 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
return mp.INFECTED
