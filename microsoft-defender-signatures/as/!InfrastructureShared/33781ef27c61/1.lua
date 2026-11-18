-- Threat: !InfrastructureShared
-- Name: 33781ef27c61
-- Type: 21

if pesecs[4].Name == ".rsrc" and pesecs[4].VirtualSize == 984 and pesecs[4].SizeOfRawData == 1024 then
  return mp.INFECTED
end
return mp.CLEAN
