-- Threat: !InfrastructureShared
-- Name: 357827f1fb93
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
