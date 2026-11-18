-- Threat: !InfrastructureShared
-- Name: 2178fe4d9b8f
-- Type: 21

if peattributes.packed and mp.get_mpattribute("SIGATTR:deepemu") and mp.get_mpattribute("MpHasExpensiveLoop") then
  return mp.INFECTED
end
return mp.CLEAN
