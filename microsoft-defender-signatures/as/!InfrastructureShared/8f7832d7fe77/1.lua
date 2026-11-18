-- Threat: !InfrastructureShared
-- Name: 8f7832d7fe77
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
