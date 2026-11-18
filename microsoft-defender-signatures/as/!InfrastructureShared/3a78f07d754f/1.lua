-- Threat: !InfrastructureShared
-- Name: 3a78f07d754f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
