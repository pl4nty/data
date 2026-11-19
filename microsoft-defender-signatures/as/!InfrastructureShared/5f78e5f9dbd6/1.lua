-- Threat: !InfrastructureShared
-- Name: 5f78e5f9dbd6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
