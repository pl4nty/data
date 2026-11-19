-- Threat: !InfrastructureShared
-- Name: 115787b180916
-- Type: 21

if peattributes.ismsil then
  if mp.HSTR_WEIGHT >= 4 then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
