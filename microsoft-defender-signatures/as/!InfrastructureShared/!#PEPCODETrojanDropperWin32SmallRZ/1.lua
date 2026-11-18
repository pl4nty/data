-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:TrojanDropper:Win32/Small.RZ
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.firstsectwritable ~= true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].Size ~= 0 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[3].Size then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 0 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
