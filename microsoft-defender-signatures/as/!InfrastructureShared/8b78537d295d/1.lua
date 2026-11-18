-- Threat: !InfrastructureShared
-- Name: 8b78537d295d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
