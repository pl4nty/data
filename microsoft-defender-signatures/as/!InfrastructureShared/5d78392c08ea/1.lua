-- Threat: !InfrastructureShared
-- Name: 5d78392c08ea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
