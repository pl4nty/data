-- Threat: !InfrastructureShared
-- Name: 9c78c3d0675d
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 8 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.LOWFI
