-- Threat: !InfrastructureShared
-- Name: 6b7849c4a308
-- Type: 21

if peattributes.no_resources and peattributes.suspicious_dosheader then
  return mp.INFECTED
end
return mp.CLEAN
