-- Threat: !InfrastructureShared
-- Name: 3678b32b11a2
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
