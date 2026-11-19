-- Threat: !InfrastructureShared
-- Name: b378e80b9c62
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
