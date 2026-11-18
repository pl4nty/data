-- Threat: !InfrastructureShared
-- Name: 13b78afc7a183
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 100000 and mp.getfilesize() < 110000 then
  return mp.INFECTED
end
return mp.CLEAN
