-- Threat: !InfrastructureShared
-- Name: 1e786da989ec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
