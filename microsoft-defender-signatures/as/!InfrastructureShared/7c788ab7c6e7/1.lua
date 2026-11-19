-- Threat: !InfrastructureShared
-- Name: 7c788ab7c6e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
