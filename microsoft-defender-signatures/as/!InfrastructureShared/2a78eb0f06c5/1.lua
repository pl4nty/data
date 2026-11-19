-- Threat: !InfrastructureShared
-- Name: 2a78eb0f06c5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
