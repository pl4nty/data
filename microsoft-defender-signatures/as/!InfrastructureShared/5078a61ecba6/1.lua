-- Threat: !InfrastructureShared
-- Name: 5078a61ecba6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
