-- Threat: !InfrastructureShared
-- Name: a7781ab1d7fd
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
if hstrlog[1].matched then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.CLEAN
