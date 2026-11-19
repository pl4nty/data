-- Threat: !InfrastructureShared
-- Name: 10678e59671d1
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
