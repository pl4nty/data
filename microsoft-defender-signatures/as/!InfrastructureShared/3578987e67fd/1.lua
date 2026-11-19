-- Threat: !InfrastructureShared
-- Name: 3578987e67fd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
