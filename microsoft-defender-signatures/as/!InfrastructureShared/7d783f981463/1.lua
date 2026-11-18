-- Threat: !InfrastructureShared
-- Name: 7d783f981463
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched and (hstrlog[4].matched or hstrlog[5].matched) then
  return mp.INFECTED
end
return mp.CLEAN
