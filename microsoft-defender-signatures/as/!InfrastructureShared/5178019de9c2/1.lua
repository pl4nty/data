-- Threat: !InfrastructureShared
-- Name: 5178019de9c2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 3710000 then
  return mp.INFECTED
end
return mp.CLEAN
