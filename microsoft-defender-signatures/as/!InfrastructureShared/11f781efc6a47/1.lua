-- Threat: !InfrastructureShared
-- Name: 11f781efc6a47
-- Type: 21

if mp.bitand(mp.HSTR_WEIGHT, 248) >= 8 then
  if mp.bitand(mp.HSTR_WEIGHT, 7) >= 1 then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
