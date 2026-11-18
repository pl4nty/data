-- Threat: !InfrastructureShared
-- Name: 9061dfab4a86
-- Type: 21

if not hstrlog[2].matched and not hstrlog[3].matched then
  return mp.CLEAN
end
if not hstrlog[4].matched and not hstrlog[5].matched and not hstrlog[6].matched then
  return mp.CLEAN
end
return mp.INFECTED
