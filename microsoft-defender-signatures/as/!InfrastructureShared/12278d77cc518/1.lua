-- Threat: !InfrastructureShared
-- Name: 12278d77cc518
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
