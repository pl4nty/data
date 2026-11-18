-- Threat: !InfrastructureShared
-- Name: 15b78ebb8a024
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
