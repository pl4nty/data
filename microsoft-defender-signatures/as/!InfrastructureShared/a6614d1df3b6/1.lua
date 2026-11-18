-- Threat: !InfrastructureShared
-- Name: a6614d1df3b6
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[3].matched or hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
