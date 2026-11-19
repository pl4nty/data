-- Threat: !InfrastructureShared
-- Name: 6f78e519f657
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
