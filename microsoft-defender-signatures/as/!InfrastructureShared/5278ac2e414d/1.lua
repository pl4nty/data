-- Threat: !InfrastructureShared
-- Name: 5278ac2e414d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
