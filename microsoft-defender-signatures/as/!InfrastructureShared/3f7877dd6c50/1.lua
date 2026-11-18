-- Threat: !InfrastructureShared
-- Name: 3f7877dd6c50
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
