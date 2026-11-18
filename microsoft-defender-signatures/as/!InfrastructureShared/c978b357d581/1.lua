-- Threat: !InfrastructureShared
-- Name: c978b357d581
-- Type: 21

if peattributes.isdll == true and pehdr.NumberOfSections == 4 then
  return mp.INFECTED
end
return mp.CLEAN
