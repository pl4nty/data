-- Threat: !InfrastructureShared
-- Name: 3078f582c08e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
