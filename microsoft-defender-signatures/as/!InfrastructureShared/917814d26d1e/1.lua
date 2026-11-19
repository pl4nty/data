-- Threat: !InfrastructureShared
-- Name: 917814d26d1e
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Win32/Qakbot.PAA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
