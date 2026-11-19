-- Threat: !InfrastructureShared
-- Name: 5a290ee8777d
-- Type: 21

if string.find(mp.getfilename(), "%->%(RarSfx%)%->%w+%.exe%->%(RarSfx%)") == nil then
  return mp.CLEAN
end
return mp.INFECTED
