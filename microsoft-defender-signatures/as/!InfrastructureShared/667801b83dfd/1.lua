-- Threat: !InfrastructureShared
-- Name: 667801b83dfd
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
