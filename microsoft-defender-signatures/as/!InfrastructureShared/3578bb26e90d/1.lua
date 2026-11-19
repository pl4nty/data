-- Threat: !InfrastructureShared
-- Name: 3578bb26e90d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
