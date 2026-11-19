-- Threat: !InfrastructureShared
-- Name: df7801ded993
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
