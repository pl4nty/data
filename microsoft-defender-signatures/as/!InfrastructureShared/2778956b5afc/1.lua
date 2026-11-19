-- Threat: !InfrastructureShared
-- Name: 2778956b5afc
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
