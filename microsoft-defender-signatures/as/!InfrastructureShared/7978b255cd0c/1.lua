-- Threat: !InfrastructureShared
-- Name: 7978b255cd0c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
