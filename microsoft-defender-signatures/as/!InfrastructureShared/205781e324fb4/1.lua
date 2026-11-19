-- Threat: !InfrastructureShared
-- Name: 205781e324fb4
-- Type: 21

if mp.getfilesize() < 1048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
