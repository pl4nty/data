-- Threat: !InfrastructureShared
-- Name: e54004ec8699
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
