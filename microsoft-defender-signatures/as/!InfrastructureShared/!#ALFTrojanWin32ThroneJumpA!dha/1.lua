-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ThroneJump.A!dha
-- Type: 10

if pehdr.NumberOfSections > 4 and pehdr.NumberOfSections < 16 and pesecs[pehdr.NumberOfSections].Name == ".idata" and pesecs[pehdr.NumberOfSections].SizeOfRawData > 32768 and pesecs[pehdr.NumberOfSections - 1].Name == ".v-lizer" then
  return mp.INFECTED
end
return mp.CLEAN
