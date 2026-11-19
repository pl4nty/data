-- Threat: !InfrastructureShared
-- Name: 10778659db09b
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 10 and hstrlog[3].matched and hstrlog[8].matched then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT == 9 then
  return mp.SUSPICIOUS
end
return mp.INFECTED
