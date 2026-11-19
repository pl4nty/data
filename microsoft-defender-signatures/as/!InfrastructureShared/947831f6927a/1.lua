-- Threat: !InfrastructureShared
-- Name: 947831f6927a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
