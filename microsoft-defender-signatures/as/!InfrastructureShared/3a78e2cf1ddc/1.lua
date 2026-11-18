-- Threat: !InfrastructureShared
-- Name: 3a78e2cf1ddc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
