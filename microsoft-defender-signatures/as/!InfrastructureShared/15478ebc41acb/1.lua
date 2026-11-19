-- Threat: !InfrastructureShared
-- Name: 15478ebc41acb
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 30 and hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT >= 27 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.SUSPICIOUS
