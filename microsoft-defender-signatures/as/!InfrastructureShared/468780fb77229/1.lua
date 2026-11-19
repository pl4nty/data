-- Threat: !InfrastructureShared
-- Name: 468780fb77229
-- Type: 21

if peattributes.isvbpcode or peattributes.isvbnative then
  return mp.INFECTED
end
return mp.CLEAN
