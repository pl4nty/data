-- Threat: !InfrastructureShared
-- Name: c178a2ed049f
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.LOWFI
