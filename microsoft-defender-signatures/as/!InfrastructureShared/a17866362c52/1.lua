-- Threat: !InfrastructureShared
-- Name: a17866362c52
-- Type: 21

if peattributes.isvbpcode == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
