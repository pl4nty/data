-- Threat: !InfrastructureShared
-- Name: 3378e31e6e52
-- Type: 21

if pesecs[1].Name == "CODE" and pesecs[2].Name == "DATA" and pesecs[3].Name == "BSS" or pesecs[1].Name == "UPX0" and pesecs[2].Name == "UPX1" then
  return mp.INFECTED
end
return mp.CLEAN
