-- Threat: !InfrastructureShared
-- Name: 4378712ce782
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
