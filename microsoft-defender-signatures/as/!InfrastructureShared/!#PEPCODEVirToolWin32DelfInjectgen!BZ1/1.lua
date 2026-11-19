-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VirTool:Win32/DelfInject.gen!BZ.1
-- Type: 8

if epcode[1] ~= 77 then
  return mp.CLEAN
end
if epcode[2] ~= 90 then
  return mp.CLEAN
end
if epcode[5] ~= 233 then
  return mp.CLEAN
end
if epcode[8] ~= 0 then
  return mp.CLEAN
end
if epcode[9] ~= 0 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint ~= 0 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 1162104643 then
  return mp.CLEAN
end
if pesecs[1].VirtualAddress ~= 4096 then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= false then
  return mp.CLEAN
end
if peattributes.epinfirstsect == true then
  return mp.CLEAN
end
return mp.INFECTED
