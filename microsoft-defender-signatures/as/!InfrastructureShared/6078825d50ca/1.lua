-- Threat: !InfrastructureShared
-- Name: 6078825d50ca
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
