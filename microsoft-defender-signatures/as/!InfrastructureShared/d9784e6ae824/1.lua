-- Threat: !InfrastructureShared
-- Name: d9784e6ae824
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
