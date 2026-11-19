-- Threat: !InfrastructureShared
-- Name: 9978d58b474a
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == false and pehdr.NumberOfSections == 9 then
  return mp.INFECTED
end
return mp.CLEAN
