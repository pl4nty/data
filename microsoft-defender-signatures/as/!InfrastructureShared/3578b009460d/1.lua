-- Threat: !InfrastructureShared
-- Name: 3578b009460d
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
