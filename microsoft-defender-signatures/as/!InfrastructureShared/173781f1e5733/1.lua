-- Threat: !InfrastructureShared
-- Name: 173781f1e5733
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
