-- Threat: !InfrastructureShared
-- Name: ce78f7688bee
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
