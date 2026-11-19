-- Threat: !InfrastructureShared
-- Name: 1154098413a1c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
