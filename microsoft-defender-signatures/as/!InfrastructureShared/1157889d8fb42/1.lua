-- Threat: !InfrastructureShared
-- Name: 1157889d8fb42
-- Type: 21

if mp.bitand(mp.HSTR_WEIGHT, 992) >= 32 and mp.bitand(mp.HSTR_WEIGHT, 31) >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
