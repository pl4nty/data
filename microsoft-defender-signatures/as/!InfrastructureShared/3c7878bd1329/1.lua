-- Threat: !InfrastructureShared
-- Name: 3c7878bd1329
-- Type: 21

if peattributes.dt_error_not_enough_memory then
  pe.set_peattribute("enable_vmm_grow", true)
  pe.reemulate()
end
return mp.INFECTED
