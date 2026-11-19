-- Threat: !InfrastructureShared
-- Name: 877833755f6e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
