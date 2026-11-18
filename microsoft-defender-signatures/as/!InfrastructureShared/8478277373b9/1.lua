-- Threat: !InfrastructureShared
-- Name: 8478277373b9
-- Type: 21

if peattributes.hasexports and peattributes.isdll and peattributes.executable_image then
  return mp.INFECTED
end
return mp.CLEAN
