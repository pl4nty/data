-- Threat: !InfrastructureShared
-- Name: 978f179352e3
-- Type: 21

if mp.get_mpattribute("MACRO_HSTR:OfficeAutoOpen") and mp.get_mpattribute("MACRO_HSTR:PowerShell") then
  return mp.INFECTED
end
return mp.CLEAN
