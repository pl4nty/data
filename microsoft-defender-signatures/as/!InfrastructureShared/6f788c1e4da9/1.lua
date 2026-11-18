-- Threat: !InfrastructureShared
-- Name: 6f788c1e4da9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
