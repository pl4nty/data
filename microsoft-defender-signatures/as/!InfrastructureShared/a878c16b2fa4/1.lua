-- Threat: !InfrastructureShared
-- Name: a878c16b2fa4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
