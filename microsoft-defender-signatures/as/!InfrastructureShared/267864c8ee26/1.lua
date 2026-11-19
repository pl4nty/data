-- Threat: !InfrastructureShared
-- Name: 267864c8ee26
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
