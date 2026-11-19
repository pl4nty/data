-- Threat: !InfrastructureShared
-- Name: be787490306d
-- Type: 21

if mp.getfilesize() > 976800 and mp.getfilesize() < 1330584 and pesecs[5].Name == "INIT" and pesecs[5].Characteristics == 3791650848 then
  return mp.INFECTED
end
return mp.CLEAN
