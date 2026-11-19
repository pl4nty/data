-- Threat: !InfrastructureShared
-- Name: 6d780a076b4d
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT > 4 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.LOWFI
