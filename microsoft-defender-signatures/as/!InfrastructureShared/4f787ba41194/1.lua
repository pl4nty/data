-- Threat: !InfrastructureShared
-- Name: 4f787ba41194
-- Type: 21
-- Flags: 1

if (hstrlog[4].matched or hstrlog[5].matched) and hstrlog[1].VA < hstrlog[2].VA and hstrlog[2].VA < hstrlog[3].VA then
  return mp.INFECTED
end
return mp.CLEAN
