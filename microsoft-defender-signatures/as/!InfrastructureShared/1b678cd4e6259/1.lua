-- Threat: !InfrastructureShared
-- Name: 1b678cd4e6259
-- Type: 21

if peattributes.isvbpcode or peattributes.isvbnative then
  return mp.INFECTED
end
return mp.CLEAN
