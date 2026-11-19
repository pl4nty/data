-- Threat: !InfrastructureShared
-- Name: 1a978dfe4eca4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
