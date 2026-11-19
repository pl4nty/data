-- Threat: !InfrastructureShared
-- Name: b478d0fecd57
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
