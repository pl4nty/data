-- Threat: !InfrastructureShared
-- Name: aa8fd2e542fd
-- Type: 21

if hstrlog[1].matched or hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
