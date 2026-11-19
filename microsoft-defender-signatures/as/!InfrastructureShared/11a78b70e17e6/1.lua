-- Threat: !InfrastructureShared
-- Name: 11a78b70e17e6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
