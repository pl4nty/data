-- Threat: !InfrastructureShared
-- Name: e28a4af2883
-- Type: 21

if string.find(mp.getfilename(), "%->%(ZipSfx%)%->.+%.bat$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
