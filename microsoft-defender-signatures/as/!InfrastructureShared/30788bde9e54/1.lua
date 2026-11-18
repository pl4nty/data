-- Threat: !InfrastructureShared
-- Name: 30788bde9e54
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  return mp.LOWFI
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
