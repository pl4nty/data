-- Threat: !InfrastructureShared
-- Name: b1782a2f73f2
-- Type: 21

if peattributes.isvbpcode or peattributes.isvbnative then
  return mp.INFECTED
end
return mp.CLEAN
