-- Threat: !InfrastructureShared
-- Name: 13729ae4f9765
-- Type: 21

if string.find(string.lower(mp.getfilename()), "%-%>%(encscript%)$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
