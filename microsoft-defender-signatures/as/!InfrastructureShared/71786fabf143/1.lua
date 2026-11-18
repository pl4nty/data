-- Threat: !InfrastructureShared
-- Name: 71786fabf143
-- Type: 21

if peattributes.no_security and pesecs[8].Name ~= nil and pesecs[8].Name == "ogleyyy" then
  return mp.INFECTED
end
return mp.CLEAN
