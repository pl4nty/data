-- Threat: !InfrastructureShared
-- Name: 5a784e524cff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
