-- Threat: !InfrastructureShared
-- Name: 797883a255ce
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
