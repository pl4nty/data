-- Threat: !InfrastructureShared
-- Name: 11578f3387d30
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
if hstrlog[1].matched and hstrlog[2].matched then
  return mp.INFECTED
end
if hstrlog[1].matched or hstrlog[2].matched then
  return mp.LOWFI
end
return mp.CLEAN
