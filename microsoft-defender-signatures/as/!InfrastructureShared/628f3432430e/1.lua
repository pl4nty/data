-- Threat: !InfrastructureShared
-- Name: 628f3432430e
-- Type: 21

if hstrlog[4].matched and hstrlog[4].hitcount > 5 then
  return mp.INFECTED
end
return mp.LOWFI
