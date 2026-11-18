-- Threat: !InfrastructureShared
-- Name: 3b78f0d01f21
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
