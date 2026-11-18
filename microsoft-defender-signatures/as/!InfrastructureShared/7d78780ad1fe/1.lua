-- Threat: !InfrastructureShared
-- Name: 7d78780ad1fe
-- Type: 21

if mp.get_mpattribute("SIGATTR:ASEP") and peattributes.reads_vdll_code then
  return mp.INFECTED
end
return mp.CLEAN
