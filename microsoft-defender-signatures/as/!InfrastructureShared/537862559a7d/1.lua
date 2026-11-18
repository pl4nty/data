-- Threat: !InfrastructureShared
-- Name: 537862559a7d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
