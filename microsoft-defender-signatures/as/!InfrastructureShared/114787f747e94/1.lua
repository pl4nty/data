-- Threat: !InfrastructureShared
-- Name: 114787f747e94
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
