-- Threat: !InfrastructureShared
-- Name: 189785dccfd22
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 24 then
  return mp.INFECTED
end
if not (mp.get_mpattribute("pea_enable_vmm_grow") and mp.get_mpattribute("do_exhaustivehstr_rescan")) or not mp.get_mpattribute("pea_deep_analysis") then
  pe.set_peattribute("enable_vmm_grow", true)
  pe.set_peattribute("deep_analysis", true)
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.LOWFI
