-- Threat: !InfrastructureShared
-- Name: 7e78e707b3fa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
