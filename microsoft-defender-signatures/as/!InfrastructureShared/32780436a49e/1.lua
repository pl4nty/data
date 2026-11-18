-- Threat: !InfrastructureShared
-- Name: 32780436a49e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
