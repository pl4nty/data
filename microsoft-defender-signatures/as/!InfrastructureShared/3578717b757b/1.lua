-- Threat: !InfrastructureShared
-- Name: 3578717b757b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
