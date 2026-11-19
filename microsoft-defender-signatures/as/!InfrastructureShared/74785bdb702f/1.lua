-- Threat: !InfrastructureShared
-- Name: 74785bdb702f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
