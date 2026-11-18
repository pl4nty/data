-- Threat: !InfrastructureShared
-- Name: 2b78abfc13df
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
