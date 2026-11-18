-- Threat: !InfrastructureShared
-- Name: e5788695fc12
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
