-- Threat: !InfrastructureShared
-- Name: 3178894d63dc
-- Type: 21

if pesecs[9].Name == ".tls" and pesecs[9].Characteristics == 3221225536 and mp.getfilesize() <= 120000 then
  return mp.INFECTED
end
return mp.CLEAN
