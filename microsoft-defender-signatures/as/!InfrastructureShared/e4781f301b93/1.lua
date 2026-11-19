-- Threat: !InfrastructureShared
-- Name: e4781f301b93
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched or hstrlog[3].matched and hstrlog[4].matched and hstrlog[5].matched or hstrlog[6].matched and hstrlog[7].matched and hstrlog[8].matched or hstrlog[9].matched then
  return mp.INFECTED
end
return mp.CLEAN
