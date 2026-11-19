-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VirTool:Win32/Obfuscator.FF
-- Type: 8

if pehdr.AddressOfEntryPoint ~= 0 then
  return mp.CLEAN
end
if pehdr.SizeOfCode ~= 0 then
  return mp.CLEAN
end
if epcode[1] ~= 77 then
  return mp.CLEAN
end
if epcode[2] ~= 90 then
  return mp.CLEAN
end
if epcode[4] ~= 235 then
  return mp.CLEAN
end
if epcode[5] ~= 1 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData ~= 0 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].PointerToRawData ~= 0 then
  return mp.CLEAN
end
if pesecs[1].Characteristics ~= 3758096480 then
  return mp.CLEAN
end
return mp.INFECTED
