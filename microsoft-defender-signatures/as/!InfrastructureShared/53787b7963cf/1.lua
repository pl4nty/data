-- Threat: !InfrastructureShared
-- Name: 53787b7963cf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
