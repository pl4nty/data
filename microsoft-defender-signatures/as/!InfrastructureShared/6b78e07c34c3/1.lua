-- Threat: !InfrastructureShared
-- Name: 6b78e07c34c3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
