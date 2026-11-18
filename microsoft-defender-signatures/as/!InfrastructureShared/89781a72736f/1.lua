-- Threat: !InfrastructureShared
-- Name: 89781a72736f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
