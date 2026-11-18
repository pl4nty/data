-- Threat: !InfrastructureShared
-- Name: db789fb4f05d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
