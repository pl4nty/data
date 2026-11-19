-- Threat: !InfrastructureShared
-- Name: 5b7823e7c39e
-- Type: 21

if peattributes.isdll and pesecs[3].Name == ".zbss" then
  return mp.INFECTED
end
return mp.CLEAN
