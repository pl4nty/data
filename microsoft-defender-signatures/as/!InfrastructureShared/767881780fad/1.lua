-- Threat: !InfrastructureShared
-- Name: 767881780fad
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
