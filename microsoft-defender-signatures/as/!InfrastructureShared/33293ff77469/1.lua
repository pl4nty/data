-- Threat: !InfrastructureShared
-- Name: 33293ff77469
-- Type: 21

if string.find(mp.getfilename(), "%-%>%(VFS%:%d+%.bat%)$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
