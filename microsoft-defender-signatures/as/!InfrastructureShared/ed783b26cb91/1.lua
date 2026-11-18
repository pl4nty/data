-- Threat: !InfrastructureShared
-- Name: ed783b26cb91
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
