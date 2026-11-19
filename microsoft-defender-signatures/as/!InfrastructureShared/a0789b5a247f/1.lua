-- Threat: !InfrastructureShared
-- Name: a0789b5a247f
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
elseif hstrlog[1].matched then
  return mp.LOWFI
end
return mp.CLEAN
