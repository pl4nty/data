-- Threat: !InfrastructureShared
-- Name: 5d78e5de7fbe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
