-- Threat: !InfrastructureShared
-- Name: 7978e0619b50
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
