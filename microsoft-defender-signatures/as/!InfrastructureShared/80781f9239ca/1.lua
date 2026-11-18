-- Threat: !InfrastructureShared
-- Name: 80781f9239ca
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
