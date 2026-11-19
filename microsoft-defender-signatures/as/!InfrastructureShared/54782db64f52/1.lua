-- Threat: !InfrastructureShared
-- Name: 54782db64f52
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
