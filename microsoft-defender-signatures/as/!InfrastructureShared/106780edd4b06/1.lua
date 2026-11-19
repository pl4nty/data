-- Threat: !InfrastructureShared
-- Name: 106780edd4b06
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
