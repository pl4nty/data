-- Threat: !InfrastructureShared
-- Name: 867844814b52
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
