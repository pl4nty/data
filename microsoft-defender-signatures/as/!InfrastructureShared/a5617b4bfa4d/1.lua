-- Threat: !InfrastructureShared
-- Name: a5617b4bfa4d
-- Type: 21

if not mp.get_mpattribute("pea_enable_vmm_grow") or not mp.get_mpattribute("pea_hstr_exhaustive") then
  pe.set_peattribute("enable_vmm_grow", true)
  pe.set_peattribute("hstr_exhaustive", true)
  pe.reemulate()
else
  return mp.INFECTED
end
return mp.CLEAN
