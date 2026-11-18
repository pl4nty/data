-- Threat: !InfrastructureShared
-- Name: f6787cf54bb0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
