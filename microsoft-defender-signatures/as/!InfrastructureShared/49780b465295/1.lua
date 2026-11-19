-- Threat: !InfrastructureShared
-- Name: 49780b465295
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  return mp.SUSPICIOUS
end
if mp.HSTR_WEIGHT >= 2 then
  return mp.LOWFI
end
return mp.CLEAN
