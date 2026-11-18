-- Threat: !InfrastructureShared
-- Name: e5408c06223f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
