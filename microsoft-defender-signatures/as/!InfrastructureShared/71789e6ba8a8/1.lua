-- Threat: !InfrastructureShared
-- Name: 71789e6ba8a8
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
