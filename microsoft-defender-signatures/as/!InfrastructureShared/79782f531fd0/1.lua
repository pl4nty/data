-- Threat: !InfrastructureShared
-- Name: 79782f531fd0
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT > 2 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.LOWFI
