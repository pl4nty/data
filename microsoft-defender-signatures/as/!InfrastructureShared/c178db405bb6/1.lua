-- Threat: !InfrastructureShared
-- Name: c178db405bb6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
