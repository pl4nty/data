-- Threat: !InfrastructureShared
-- Name: 14d7873b9f002
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 then
  return mp.SUSPICIOUS
end
mp.set_mpattribute("do_deep_rescan")
return mp.CLEAN
