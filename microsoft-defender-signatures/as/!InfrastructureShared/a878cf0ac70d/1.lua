-- Threat: !InfrastructureShared
-- Name: a878cf0ac70d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
