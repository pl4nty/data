-- Threat: !InfrastructureShared
-- Name: 2978072c8e75
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
