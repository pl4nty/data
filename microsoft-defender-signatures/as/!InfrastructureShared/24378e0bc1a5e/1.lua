-- Threat: !InfrastructureShared
-- Name: 24378e0bc1a5e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
