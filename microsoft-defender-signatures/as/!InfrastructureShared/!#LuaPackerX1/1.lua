-- Threat: !InfrastructureShared
-- Name: !#Lua:Packer.X1
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if pehdr.NumberOfSections > 5 and pesecs[1].SizeOfRawData == 0 and pesecs[2].SizeOfRawData == 0 and pesecs[3].SizeOfRawData == 0 then
  return mp.INFECTED
end
return mp.CLEAN
