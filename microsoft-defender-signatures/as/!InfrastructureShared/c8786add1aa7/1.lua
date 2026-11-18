-- Threat: !InfrastructureShared
-- Name: c8786add1aa7
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
else
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
