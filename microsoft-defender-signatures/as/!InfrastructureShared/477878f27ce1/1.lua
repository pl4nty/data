-- Threat: !InfrastructureShared
-- Name: 477878f27ce1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
