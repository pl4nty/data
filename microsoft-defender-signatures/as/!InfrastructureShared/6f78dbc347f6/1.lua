-- Threat: !InfrastructureShared
-- Name: 6f78dbc347f6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
