-- Threat: !InfrastructureShared
-- Name: 657876004139
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
