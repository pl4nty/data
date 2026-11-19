-- Threat: !InfrastructureShared
-- Name: 118789a5f0dd1
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 10 then
  return mp.INFECTED
else
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
