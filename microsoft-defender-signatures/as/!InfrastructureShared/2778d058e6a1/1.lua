-- Threat: !InfrastructureShared
-- Name: 2778d058e6a1
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
