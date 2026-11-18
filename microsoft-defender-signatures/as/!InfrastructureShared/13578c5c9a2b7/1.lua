-- Threat: !InfrastructureShared
-- Name: 13578c5c9a2b7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
