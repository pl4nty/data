-- Threat: !InfrastructureShared
-- Name: 7778b5e5d6ab
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5000 then
  return mp.INFECTED
end
return mp.CLEAN
