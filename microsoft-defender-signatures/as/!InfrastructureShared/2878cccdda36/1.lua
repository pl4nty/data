-- Threat: !InfrastructureShared
-- Name: 2878cccdda36
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
