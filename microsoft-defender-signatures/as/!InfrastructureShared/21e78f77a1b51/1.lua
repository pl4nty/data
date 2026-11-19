-- Threat: !InfrastructureShared
-- Name: 21e78f77a1b51
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
