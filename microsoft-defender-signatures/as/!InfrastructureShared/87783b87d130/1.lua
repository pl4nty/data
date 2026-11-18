-- Threat: !InfrastructureShared
-- Name: 87783b87d130
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
