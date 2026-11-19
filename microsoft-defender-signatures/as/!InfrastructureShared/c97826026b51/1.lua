-- Threat: !InfrastructureShared
-- Name: c97826026b51
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 16384 and mp.getfilesize() <= 20480 then
  return mp.INFECTED
end
return mp.CLEAN
