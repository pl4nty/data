-- Threat: !InfrastructureShared
-- Name: 7c782dc381be
-- Type: 21

if mp.getfilesize() > 976800 and mp.getfilesize() < 1330584 and pesecs[4].Name == "INIT" and pesecs[4].Characteristics == 3791650848 then
  return mp.INFECTED
end
return mp.CLEAN
