-- Threat: !InfrastructureShared
-- Name: 20e7895e0d5cb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
