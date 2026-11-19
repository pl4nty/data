-- Threat: !InfrastructureShared
-- Name: 10a78e4f643a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
