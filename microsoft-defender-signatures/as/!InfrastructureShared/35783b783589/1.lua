-- Threat: !InfrastructureShared
-- Name: 35783b783589
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
