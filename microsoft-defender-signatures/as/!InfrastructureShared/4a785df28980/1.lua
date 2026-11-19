-- Threat: !InfrastructureShared
-- Name: 4a785df28980
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
