-- Threat: !InfrastructureShared
-- Name: 4229369e7667
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
