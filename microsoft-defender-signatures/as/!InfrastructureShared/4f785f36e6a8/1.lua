-- Threat: !InfrastructureShared
-- Name: 4f785f36e6a8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
