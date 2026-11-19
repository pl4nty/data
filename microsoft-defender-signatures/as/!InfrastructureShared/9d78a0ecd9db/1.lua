-- Threat: !InfrastructureShared
-- Name: 9d78a0ecd9db
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
