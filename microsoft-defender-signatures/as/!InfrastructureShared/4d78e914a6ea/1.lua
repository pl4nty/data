-- Threat: !InfrastructureShared
-- Name: 4d78e914a6ea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
