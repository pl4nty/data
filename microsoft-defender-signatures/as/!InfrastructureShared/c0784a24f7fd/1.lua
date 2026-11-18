-- Threat: !InfrastructureShared
-- Name: c0784a24f7fd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
