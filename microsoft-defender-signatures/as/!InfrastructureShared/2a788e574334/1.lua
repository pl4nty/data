-- Threat: !InfrastructureShared
-- Name: 2a788e574334
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
