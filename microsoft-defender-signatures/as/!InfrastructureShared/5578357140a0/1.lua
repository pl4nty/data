-- Threat: !InfrastructureShared
-- Name: 5578357140a0
-- Type: 21

if peattributes.ismsil == true and pesecs[2].Name == ".sdata" and pesecs[2].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
