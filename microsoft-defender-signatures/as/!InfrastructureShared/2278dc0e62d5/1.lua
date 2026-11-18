-- Threat: !InfrastructureShared
-- Name: 2278dc0e62d5
-- Type: 21

if pesecs[9].Name == ".tls" and pesecs[9].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
