-- Threat: !InfrastructureShared
-- Name: ce78c932cb1b
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
mp.set_mpattribute("do_deep_rescan")
return mp.SUSPICIOUS
