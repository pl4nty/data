-- Threat: !InfrastructureShared
-- Name: 1540e455d110
-- Type: 21

if pesecs[1].Name == "UPX0" and pesecs[1].SizeOfRawData == 0 then
  return mp.INFECTED
end
return mp.CLEAN
