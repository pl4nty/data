-- Threat: !InfrastructureShared
-- Name: 59782b1180b7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
