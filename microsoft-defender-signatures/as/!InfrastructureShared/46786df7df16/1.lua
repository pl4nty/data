-- Threat: !InfrastructureShared
-- Name: 46786df7df16
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
