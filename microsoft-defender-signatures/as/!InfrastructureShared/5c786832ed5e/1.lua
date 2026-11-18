-- Threat: !InfrastructureShared
-- Name: 5c786832ed5e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
