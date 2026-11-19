-- Threat: !InfrastructureShared
-- Name: 45405571baf2
-- Type: 21

local l_0_0 = peattributes.suspicious_heap_size or peattributes.suspicious_linker_version or peattributes.suspicious_image_version or peattributes.suspicious_os_version or peattributes.suspicious_timestamp or peattributes.suspicious_section_vsize
if l_0_0 then
  pe.set_peattribute("hstr_exhaustive", true)
  mp.set_mpattribute("attrmatch_rescan_psif")
  return mp.INFECTED
end
return mp.CLEAN
