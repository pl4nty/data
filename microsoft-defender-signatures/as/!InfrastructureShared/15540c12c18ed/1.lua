-- Threat: !InfrastructureShared
-- Name: 15540c12c18ed
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
