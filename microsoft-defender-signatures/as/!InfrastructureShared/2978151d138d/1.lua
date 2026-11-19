-- Threat: !InfrastructureShared
-- Name: 2978151d138d
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[3].matched or hstrlog[2].matched and hstrlog[4].matched then
  return mp.INFECTED
end
return mp.CLEAN
