-- Threat: !InfrastructureShared
-- Name: 3578ca7f4986
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
