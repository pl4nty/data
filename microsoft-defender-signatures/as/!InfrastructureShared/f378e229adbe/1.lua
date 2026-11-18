-- Threat: !InfrastructureShared
-- Name: f378e229adbe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
