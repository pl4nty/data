-- Threat: !InfrastructureShared
-- Name: 3578e5dcea1d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
