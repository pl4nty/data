-- Threat: !InfrastructureShared
-- Name: 617856cb228e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
