-- Threat: !InfrastructureShared
-- Name: 7178693517cd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
