-- Threat: !InfrastructureShared
-- Name: 967893c330e9
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
if hstrlog[1].matched then
  return mp.LOWFI
end
return mp.CLEAN
