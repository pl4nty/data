-- Threat: !InfrastructureShared
-- Name: 104610c5e1da8
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT > 3 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.LOWFI
