-- Threat: !InfrastructureShared
-- Name: 3c78e94f63f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
