-- Threat: !InfrastructureShared
-- Name: 4d786a920816
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
