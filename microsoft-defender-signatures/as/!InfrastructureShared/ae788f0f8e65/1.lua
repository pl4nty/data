-- Threat: !InfrastructureShared
-- Name: ae788f0f8e65
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
elseif hstrlog[2].matched then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
