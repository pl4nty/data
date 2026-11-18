-- Threat: !InfrastructureShared
-- Name: 8678ac5ce288
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
