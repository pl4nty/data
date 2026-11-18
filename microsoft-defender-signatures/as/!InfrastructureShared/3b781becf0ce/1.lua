-- Threat: !InfrastructureShared
-- Name: 3b781becf0ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
