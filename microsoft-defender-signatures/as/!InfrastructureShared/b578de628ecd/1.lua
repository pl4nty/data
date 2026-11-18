-- Threat: !InfrastructureShared
-- Name: b578de628ecd
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
