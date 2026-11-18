-- Threat: !InfrastructureShared
-- Name: 147784d1c8ec7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN
