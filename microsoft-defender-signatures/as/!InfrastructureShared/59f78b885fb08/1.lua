-- Threat: !InfrastructureShared
-- Name: 59f78b885fb08
-- Type: 21

if mp.bitand(mp.HSTR_WEIGHT, 992) >= 32 and mp.bitand(mp.HSTR_WEIGHT, 31) >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
