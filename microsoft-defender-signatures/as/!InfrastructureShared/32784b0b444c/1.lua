-- Threat: !InfrastructureShared
-- Name: 32784b0b444c
-- Type: 21

if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.INFECTED
end
return mp.CLEAN
