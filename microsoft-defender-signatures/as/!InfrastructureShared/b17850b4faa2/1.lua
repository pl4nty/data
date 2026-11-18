-- Threat: !InfrastructureShared
-- Name: b17850b4faa2
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
