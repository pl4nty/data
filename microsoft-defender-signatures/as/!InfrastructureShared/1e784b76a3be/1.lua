-- Threat: !InfrastructureShared
-- Name: 1e784b76a3be
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
