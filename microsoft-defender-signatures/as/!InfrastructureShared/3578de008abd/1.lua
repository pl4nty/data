-- Threat: !InfrastructureShared
-- Name: 3578de008abd
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
