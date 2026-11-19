-- Threat: !InfrastructureShared
-- Name: 7c7884483ce0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
