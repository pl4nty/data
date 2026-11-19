-- Threat: !InfrastructureShared
-- Name: 71785fd5c05b
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
