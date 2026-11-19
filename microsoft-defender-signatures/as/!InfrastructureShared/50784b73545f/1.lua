-- Threat: !InfrastructureShared
-- Name: 50784b73545f
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
