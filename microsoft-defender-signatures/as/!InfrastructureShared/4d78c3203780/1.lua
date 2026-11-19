-- Threat: !InfrastructureShared
-- Name: 4d78c3203780
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
