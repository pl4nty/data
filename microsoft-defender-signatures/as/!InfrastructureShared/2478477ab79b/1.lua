-- Threat: !InfrastructureShared
-- Name: 2478477ab79b
-- Type: 21

if not mp.get_mpattribute("pea_enable_vmm_grow") then
  pe.set_peattribute("enable_vmm_grow", true)
  pe.reemulate()
else
  return mp.INFECTED
end
return mp.CLEAN
