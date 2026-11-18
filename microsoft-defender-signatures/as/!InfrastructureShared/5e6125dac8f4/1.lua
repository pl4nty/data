-- Threat: !InfrastructureShared
-- Name: 5e6125dac8f4
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
