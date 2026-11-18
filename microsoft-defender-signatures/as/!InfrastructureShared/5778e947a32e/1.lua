-- Threat: !InfrastructureShared
-- Name: 5778e947a32e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
