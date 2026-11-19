-- Threat: !InfrastructureShared
-- Name: e178d64afa71
-- Type: 21

if peattributes.hasexports == false and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
