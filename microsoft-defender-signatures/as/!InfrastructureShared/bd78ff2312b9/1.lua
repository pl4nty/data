-- Threat: !InfrastructureShared
-- Name: bd78ff2312b9
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
