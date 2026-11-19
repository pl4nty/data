-- Threat: !InfrastructureShared
-- Name: a3578476aeefd
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
