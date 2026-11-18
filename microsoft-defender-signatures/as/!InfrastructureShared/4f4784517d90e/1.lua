-- Threat: !InfrastructureShared
-- Name: 4f4784517d90e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
