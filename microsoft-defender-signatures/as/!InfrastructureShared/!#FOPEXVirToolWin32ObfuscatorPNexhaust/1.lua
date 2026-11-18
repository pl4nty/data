-- Threat: !InfrastructureShared
-- Name: !#FOPEX:VirTool:Win32/Obfuscator.PN.exhaust
-- Type: 8

if pevars.epsec ~= 1 and pehdr.NumberOfSections == 10 and pesecs[1].NameDW == 1701995822 then
  return mp.INFECTED
end
return mp.CLEAN
