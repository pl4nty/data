-- Threat: !InfrastructureShared
-- Name: ae78205bab43
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
