-- Threat: !InfrastructureShared
-- Name: 34786de98c50
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
