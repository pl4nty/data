-- Threat: !InfrastructureShared
-- Name: 1cc78c229b39d
-- Type: 21

if mp.getfilesize() < 2044000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
