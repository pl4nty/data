-- Threat: !InfrastructureShared
-- Name: 4778d6132e0e
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("SIGATTR:Trojan:MSIL/SnakeKeyLogger.AMDA") then
  return mp.INFECTED
end
return mp.CLEAN
