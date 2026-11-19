-- Threat: !InfrastructureShared
-- Name: b7784bea6dac
-- Type: 21

if peattributes.no_security and peattributes.isexe and mp.get_mpattribute("Lua:NoVerinfo") then
  return mp.INFECTED
end
return mp.CLEAN
