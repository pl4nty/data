-- Threat: !InfrastructureShared
-- Name: 507857946bae
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
