-- Threat: !InfrastructureShared
-- Name: ba7873942577
-- Type: 21
-- Flags: 1

if hstrlog[9].matched or mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
return mp.LOWFI
