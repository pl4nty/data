-- Threat: !InfrastructureShared
-- Name: 7e788d2f96de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
