-- Threat: !InfrastructureShared
-- Name: 738f09cc4857
-- Type: 21

if hstrlog[1].matched and hstrlog[1].hitcount > 5 then
  return mp.INFECTED
end
return mp.LOWFI
