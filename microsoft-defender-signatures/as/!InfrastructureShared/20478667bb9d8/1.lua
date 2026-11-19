-- Threat: !InfrastructureShared
-- Name: 20478667bb9d8
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
