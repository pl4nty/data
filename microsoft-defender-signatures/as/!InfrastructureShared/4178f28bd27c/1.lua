-- Threat: !InfrastructureShared
-- Name: 4178f28bd27c
-- Type: 21

if peattributes.ismsil then
  if peattributes.dt_error_not_enough_memory then
    pe.set_peattribute("enable_vmm_grow", true)
    pe.reemulate()
  end
  return mp.INFECTED
end
return mp.CLEAN
