-- Threat: !InfrastructureShared
-- Name: 71787c71c630
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 3 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT > 1 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
