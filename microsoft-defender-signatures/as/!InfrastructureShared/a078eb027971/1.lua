-- Threat: !InfrastructureShared
-- Name: a078eb027971
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.LOWFI
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
