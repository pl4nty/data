-- Threat: !InfrastructureShared
-- Name: c178c84afc7d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
