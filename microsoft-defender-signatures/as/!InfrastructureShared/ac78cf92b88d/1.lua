-- Threat: !InfrastructureShared
-- Name: ac78cf92b88d
-- Type: 21

if mp.HSTR_WEIGHT >= 101 then
  return mp.INFECTED
elseif mp.HSTR_WEIGHT >= 1 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.LOWFI
