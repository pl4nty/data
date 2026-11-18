-- Threat: !InfrastructureShared
-- Name: 7c78bcb75cf8
-- Type: 21

if peattributes.isvbpcode or peattributes.isvbnative then
  return mp.INFECTED
end
return mp.LOWFI
