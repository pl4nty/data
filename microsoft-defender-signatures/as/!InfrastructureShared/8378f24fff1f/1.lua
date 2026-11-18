-- Threat: !InfrastructureShared
-- Name: 8378f24fff1f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
