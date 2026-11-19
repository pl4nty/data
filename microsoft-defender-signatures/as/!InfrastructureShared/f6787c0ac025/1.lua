-- Threat: !InfrastructureShared
-- Name: f6787c0ac025
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
