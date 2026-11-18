-- Threat: !InfrastructureShared
-- Name: af78df706a68
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 2 or hstrlog[4].matched or hstrlog[5].matched then
  return mp.LOWFI
end
return mp.CLEAN
