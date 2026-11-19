-- Threat: !InfrastructureShared
-- Name: 9540f777df05
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
