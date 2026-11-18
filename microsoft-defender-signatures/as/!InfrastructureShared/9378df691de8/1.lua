-- Threat: !InfrastructureShared
-- Name: 9378df691de8
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("SIGATTR:Trojan:MSIL/WebShell") then
  return mp.INFECTED
end
return mp.CLEAN
