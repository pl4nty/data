-- Threat: !InfrastructureShared
-- Name: 3978dd6a0faf
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
