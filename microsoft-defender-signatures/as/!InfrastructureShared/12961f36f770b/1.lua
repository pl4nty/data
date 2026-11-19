-- Threat: !InfrastructureShared
-- Name: 12961f36f770b
-- Type: 21
-- Flags: 1

if peattributes.ismsil == true and mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
