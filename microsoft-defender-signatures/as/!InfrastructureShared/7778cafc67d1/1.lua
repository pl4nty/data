-- Threat: !InfrastructureShared
-- Name: 7778cafc67d1
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
