-- Threat: !InfrastructureShared
-- Name: 5a7803ac5d5a
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
