-- Threat: !InfrastructureShared
-- Name: 82787796b353
-- Type: 21
-- Flags: 1

if hstrlog[3].matched and mp.HSTR_WEIGHT == 1 then
  return mp.CLEAN
end
if 3 <= mp.HSTR_WEIGHT then
  return mp.INFECTED
end
return mp.LOWFI
