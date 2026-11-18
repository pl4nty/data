-- Threat: !InfrastructureShared
-- Name: e26112e4b2b0
-- Type: 21

if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
  return mp.INFECTED
end
return mp.CLEAN
