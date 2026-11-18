-- Threat: !InfrastructureShared
-- Name: 6c783d60fa1f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
