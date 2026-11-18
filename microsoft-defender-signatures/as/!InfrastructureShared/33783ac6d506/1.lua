-- Threat: !InfrastructureShared
-- Name: 33783ac6d506
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
