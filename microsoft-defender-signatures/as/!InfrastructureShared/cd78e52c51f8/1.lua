-- Threat: !InfrastructureShared
-- Name: cd78e52c51f8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
