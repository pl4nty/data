-- Threat: !InfrastructureShared
-- Name: 1f789ec8e6c1
-- Type: 21

if pevars.epsec < 3 and pehdr.NumberOfSections == 6 then
  return mp.INFECTED
end
return mp.CLEAN
