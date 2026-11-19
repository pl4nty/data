-- Threat: !InfrastructureShared
-- Name: 9e780c82b3fe
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 20 and hstrlog[1].matched and hstrlog[4].matched then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT == 11 then
  return mp.SUSPICIOUS
end
return mp.INFECTED
