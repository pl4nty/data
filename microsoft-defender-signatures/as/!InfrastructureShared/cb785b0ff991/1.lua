-- Threat: !InfrastructureShared
-- Name: cb785b0ff991
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 1 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
