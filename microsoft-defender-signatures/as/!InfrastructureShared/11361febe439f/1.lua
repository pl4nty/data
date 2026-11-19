-- Threat: !InfrastructureShared
-- Name: 11361febe439f
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 113 then
  return mp.INFECTED
elseif hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
