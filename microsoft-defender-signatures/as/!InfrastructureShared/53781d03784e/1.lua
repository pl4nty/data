-- Threat: !InfrastructureShared
-- Name: 53781d03784e
-- Type: 21

if mp.get_mpattribute("MpHasExpensiveLoop") and peattributes.dynmem_reads_vdll_code and peattributes.checks_teb_lasterror then
  return mp.SUSPICIOUS
end
return mp.CLEAN
