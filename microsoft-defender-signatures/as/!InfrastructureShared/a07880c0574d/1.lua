-- Threat: !InfrastructureShared
-- Name: a07880c0574d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
