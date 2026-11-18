-- Threat: !InfrastructureShared
-- Name: 727812e3867d
-- Type: 21
-- Flags: 1

if not mp.get_mpattribute("pea_enable_vmm_grow") then
  pe.set_peattribute("enable_vmm_grow", true)
  pe.reemulate()
else
  return mp.SUSPICIOUS
end
return mp.LOWFI
