-- Threat: !InfrastructureShared
-- Name: !#LoD:VirTool:Win32/Obfuscator.PZ.1
-- Type: 8

if pehdr.AddressOfEntryPoint ~= 238592 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize ~= 16384 then
  return mp.CLEAN
end
return mp.INFECTED
