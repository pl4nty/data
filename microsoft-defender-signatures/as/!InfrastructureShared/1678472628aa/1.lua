-- Threat: !InfrastructureShared
-- Name: 1678472628aa
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
