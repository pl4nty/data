-- Threat: !InfrastructureShared
-- Name: 2e7865a49067
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
