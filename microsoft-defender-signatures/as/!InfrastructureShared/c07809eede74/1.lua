-- Threat: !InfrastructureShared
-- Name: c07809eede74
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
