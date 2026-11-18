-- Threat: !InfrastructureShared
-- Name: 5178495862ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
