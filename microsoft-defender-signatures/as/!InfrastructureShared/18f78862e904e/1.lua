-- Threat: !InfrastructureShared
-- Name: 18f78862e904e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
