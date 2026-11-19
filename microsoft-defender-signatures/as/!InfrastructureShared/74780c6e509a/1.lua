-- Threat: !InfrastructureShared
-- Name: 74780c6e509a
-- Type: 21

if hstrlog[1].matched and mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
