-- Threat: !InfrastructureShared
-- Name: 1b578929b70a7
-- Type: 21
-- Flags: 1

if hstrlog[9].matched and (hstrlog[1].matched or hstrlog[2].matched) or (hstrlog[3].matched or hstrlog[4].matched) and (hstrlog[5].matched or hstrlog[6].matched) and hstrlog[7].matched and hstrlog[8].matched then
  return mp.INFECTED
end
return mp.CLEAN
