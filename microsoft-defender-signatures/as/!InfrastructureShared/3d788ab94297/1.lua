-- Threat: !InfrastructureShared
-- Name: 3d788ab94297
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
