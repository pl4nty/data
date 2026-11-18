-- Threat: !InfrastructureShared
-- Name: 637841d87ad9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
