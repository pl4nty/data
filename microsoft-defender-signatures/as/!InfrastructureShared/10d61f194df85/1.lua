-- Threat: !InfrastructureShared
-- Name: 10d61f194df85
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Win32/Meterpreter") and peattributes.no_security == true and mp.getfilesize() == 16896 then
  return mp.INFECTED
end
return mp.CLEAN
