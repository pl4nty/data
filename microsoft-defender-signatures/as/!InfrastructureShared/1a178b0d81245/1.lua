-- Threat: !InfrastructureShared
-- Name: 1a178b0d81245
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched) and (hstrlog[3].matched or hstrlog[4].matched) and hstrlog[5].matched and hstrlog[6].matched and hstrlog[7].matched and hstrlog[8].matched then
  return mp.INFECTED
end
return mp.CLEAN
