-- Threat: !InfrastructureShared
-- Name: 1717888adbe7c
-- Type: 21

if hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched then
  return mp.INFECTED
end
return mp.CLEAN
