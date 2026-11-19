-- Threat: !InfrastructureShared
-- Name: fd788ce96d46
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
