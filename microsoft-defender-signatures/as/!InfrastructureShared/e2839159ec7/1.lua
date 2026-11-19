-- Threat: !InfrastructureShared
-- Name: e2839159ec7
-- Type: 21

if string.find(mp.getfilename(), "%-%>%(VFS%:%d+%.bat%)$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
