-- Threat: !InfrastructureShared
-- Name: 2378fa5843dd
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.get_mpattribute("Lua:PeCompanyName!") and mp.get_mpattribute("Lua:PeProductName!") then
  return mp.INFECTED
end
return mp.CLEAN
