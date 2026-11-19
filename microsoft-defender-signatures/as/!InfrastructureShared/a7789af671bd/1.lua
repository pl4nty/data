-- Threat: !InfrastructureShared
-- Name: a7789af671bd
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 51200 then
  return mp.INFECTED
end
return mp.CLEAN
