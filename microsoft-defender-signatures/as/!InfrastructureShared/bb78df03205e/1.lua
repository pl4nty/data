-- Threat: !InfrastructureShared
-- Name: bb78df03205e
-- Type: 21

if mp.HSTR_WEIGHT >= 12 then
  return mp.INFECTED
elseif hstrlog[3].matched then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
