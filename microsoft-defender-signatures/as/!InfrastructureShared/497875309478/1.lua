-- Threat: !InfrastructureShared
-- Name: 497875309478
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
