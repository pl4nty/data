-- Threat: !InfrastructureShared
-- Name: 2678124321e3
-- Type: 21

if pesecs[8].Name == ".winlice" and pesecs[8].Characteristics == 3758096480 and pesecs[9].Name == ".boot" and pesecs[9].Characteristics == 1610612832 then
  return mp.INFECTED
end
return mp.CLEAN
