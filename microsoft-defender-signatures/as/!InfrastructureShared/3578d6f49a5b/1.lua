-- Threat: !InfrastructureShared
-- Name: 3578d6f49a5b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
