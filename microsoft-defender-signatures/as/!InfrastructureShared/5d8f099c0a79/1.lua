-- Threat: !InfrastructureShared
-- Name: 5d8f099c0a79
-- Type: 21

if hstrlog[1].matched and hstrlog[1].hitcount > 2 then
  return mp.INFECTED
end
if hstrlog[2].matched and 2 < hstrlog[2].hitcount then
  return mp.INFECTED
end
if hstrlog[2].matched and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.LOWFI
