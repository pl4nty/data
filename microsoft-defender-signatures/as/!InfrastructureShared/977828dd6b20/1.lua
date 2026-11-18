-- Threat: !InfrastructureShared
-- Name: 977828dd6b20
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
