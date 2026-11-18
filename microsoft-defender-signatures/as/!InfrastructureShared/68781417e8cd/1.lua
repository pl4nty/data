-- Threat: !InfrastructureShared
-- Name: 68781417e8cd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
