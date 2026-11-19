-- Threat: !InfrastructureShared
-- Name: 3f78134f3a01
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
