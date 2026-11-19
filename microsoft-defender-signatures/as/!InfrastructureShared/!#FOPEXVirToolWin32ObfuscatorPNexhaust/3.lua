-- Threat: !InfrastructureShared
-- Name: !#FOPEX:VirTool:Win32/Obfuscator.PN.exhaust
-- Type: 8

if pehdr.NumberOfSections > 3 and pesecs[2].VirtualSize > 336 and pesecs[2].VirtualSize < 432 and pesecs[3].VirtualSize >= 13354 and pesecs[3].VirtualSize <= 13356 then
  return mp.INFECTED
end
return mp.CLEAN
