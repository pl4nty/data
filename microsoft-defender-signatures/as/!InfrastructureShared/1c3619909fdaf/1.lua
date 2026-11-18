-- Threat: !InfrastructureShared
-- Name: 1c3619909fdaf
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
