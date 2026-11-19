-- Threat: !InfrastructureShared
-- Name: 6e78a9b4c5c8
-- Type: 21

if pesecs[5].Name == ".xdata" and pesecs[5].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
