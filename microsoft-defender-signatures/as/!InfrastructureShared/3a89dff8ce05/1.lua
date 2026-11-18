-- Threat: !InfrastructureShared
-- Name: 3a89dff8ce05
-- Type: 21

if pevars.sigaddr ~= 4198400 then
  return mp.CLEAN
end
pe.set_peattribute("hstr_exhaustive", true)
return mp.INFECTED
