-- Threat: !InfrastructureShared
-- Name: aa78edd7b8af
-- Type: 21

if hstrlog[1].matched and (hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched) then
  return mp.INFECTED
end
return mp.CLEAN
