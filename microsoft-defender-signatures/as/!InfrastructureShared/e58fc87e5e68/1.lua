-- Threat: !InfrastructureShared
-- Name: e58fc87e5e68
-- Type: 21

if mp.get_mpattribute("MACRO_HSTR:OfficeAutoOpen") then
  return mp.INFECTED
end
return mp.LOWFI
