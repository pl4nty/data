-- Threat: !InfrastructureShared
-- Name: 39781f6b44f1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
