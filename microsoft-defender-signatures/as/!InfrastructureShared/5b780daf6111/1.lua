-- Threat: !InfrastructureShared
-- Name: 5b780daf6111
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
