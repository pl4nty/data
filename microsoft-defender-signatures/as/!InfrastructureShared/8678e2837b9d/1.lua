-- Threat: !InfrastructureShared
-- Name: 8678e2837b9d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
