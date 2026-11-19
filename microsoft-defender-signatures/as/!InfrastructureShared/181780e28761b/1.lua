-- Threat: !InfrastructureShared
-- Name: 181780e28761b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
