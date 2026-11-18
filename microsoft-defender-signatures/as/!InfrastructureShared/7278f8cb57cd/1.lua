-- Threat: !InfrastructureShared
-- Name: 7278f8cb57cd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
