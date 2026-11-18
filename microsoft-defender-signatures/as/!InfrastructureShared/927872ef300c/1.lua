-- Threat: !InfrastructureShared
-- Name: 927872ef300c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
