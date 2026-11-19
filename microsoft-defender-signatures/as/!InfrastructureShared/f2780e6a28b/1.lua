-- Threat: !InfrastructureShared
-- Name: f2780e6a28b
-- Type: 21

if string.find(mp.getfilename(), "%-%>%(RarSfx%)%-%>%w+%.vbs$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
