-- Threat: !InfrastructureShared
-- Name: 8e78920e3cf5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
