-- Threat: !InfrastructureShared
-- Name: 13a7895eea07a
-- Type: 21

if hstrlog[4].matched or hstrlog[8].matched then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
