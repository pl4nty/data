-- Threat: !InfrastructureShared
-- Name: 607886b8c078
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
