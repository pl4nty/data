-- Threat: !InfrastructureShared
-- Name: dc78260e04c3
-- Type: 21

mp.set_mpattribute("HSTR:BetterSurf")
if mp.HSTR_WEIGHT >= 7 then
  return mp.INFECTED
end
return mp.CLEAN
