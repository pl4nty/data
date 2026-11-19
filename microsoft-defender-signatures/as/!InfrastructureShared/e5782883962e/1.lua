-- Threat: !InfrastructureShared
-- Name: e5782883962e
-- Type: 21

if hstrlog[1].matched and (hstrlog[2].matched or hstrlog[3].matched) and (hstrlog[4].matched or hstrlog[5].matched) then
  return mp.INFECTED
end
return mp.CLEAN
