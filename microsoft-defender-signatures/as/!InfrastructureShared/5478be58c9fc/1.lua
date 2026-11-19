-- Threat: !InfrastructureShared
-- Name: 5478be58c9fc
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
