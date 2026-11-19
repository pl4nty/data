-- Threat: !InfrastructureShared
-- Name: 4e78ccbd3e3a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
