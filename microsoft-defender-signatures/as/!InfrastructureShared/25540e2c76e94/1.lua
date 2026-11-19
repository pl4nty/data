-- Threat: !InfrastructureShared
-- Name: 25540e2c76e94
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
