-- Threat: !InfrastructureShared
-- Name: 63780bc241f3
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
pe.set_peattribute("hstr_exhaustive", true)
pe.reemulate()
return mp.CLEAN
