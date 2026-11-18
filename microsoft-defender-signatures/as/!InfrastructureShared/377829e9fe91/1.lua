-- Threat: !InfrastructureShared
-- Name: 377829e9fe91
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
