-- Threat: !InfrastructureShared
-- Name: 6678cb5f247b
-- Type: 21

if peattributes.ismsil and mp.getfilesize() <= 327680 then
  return mp.INFECTED
end
return mp.CLEAN
