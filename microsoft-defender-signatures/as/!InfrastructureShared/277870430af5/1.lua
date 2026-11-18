-- Threat: !InfrastructureShared
-- Name: 277870430af5
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
