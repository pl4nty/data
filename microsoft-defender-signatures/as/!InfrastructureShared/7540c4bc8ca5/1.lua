-- Threat: !InfrastructureShared
-- Name: 7540c4bc8ca5
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
