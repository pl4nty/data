-- Threat: !InfrastructureShared
-- Name: 417813db11c2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
