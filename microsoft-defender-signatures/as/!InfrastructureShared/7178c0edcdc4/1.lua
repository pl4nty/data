-- Threat: !InfrastructureShared
-- Name: 7178c0edcdc4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
