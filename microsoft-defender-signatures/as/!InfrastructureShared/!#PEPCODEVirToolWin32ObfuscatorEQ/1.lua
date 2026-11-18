-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VirTool:Win32/Obfuscator.EQ
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.lastscn_falign ~= true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if epcode[1] ~= 233 then
  return mp.CLEAN
end
if epcode[3] ~= 0 then
  return mp.CLEAN
end
if epcode[4] ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
