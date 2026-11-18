-- Threat: !InfrastructureShared
-- Name: 14d780a9b707d
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 12 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
