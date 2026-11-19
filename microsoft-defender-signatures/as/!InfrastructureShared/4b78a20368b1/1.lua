-- Threat: !InfrastructureShared
-- Name: 4b78a20368b1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
