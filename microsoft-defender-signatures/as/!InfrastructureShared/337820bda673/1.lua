-- Threat: !InfrastructureShared
-- Name: 337820bda673
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
