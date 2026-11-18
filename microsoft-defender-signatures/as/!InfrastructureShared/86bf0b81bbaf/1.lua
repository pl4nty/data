-- Threat: !InfrastructureShared
-- Name: 86bf0b81bbaf
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT == 4 then
  return mp.LOWFI
end
return mp.CLEAN
