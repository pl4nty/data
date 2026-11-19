-- Threat: !InfrastructureShared
-- Name: 19540e7ec9e96
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
