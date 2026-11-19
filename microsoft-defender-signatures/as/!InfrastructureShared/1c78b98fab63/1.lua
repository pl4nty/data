-- Threat: !InfrastructureShared
-- Name: 1c78b98fab63
-- Type: 21

if pesecs[4].Name == ".ctls0" and pesecs[6].Name == ".jetb" then
  return mp.INFECTED
end
return mp.CLEAN
