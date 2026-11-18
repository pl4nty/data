-- Threat: !InfrastructureShared
-- Name: 4b78edf6c46a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
