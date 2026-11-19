-- Threat: !InfrastructureShared
-- Name: 11c29b9c2ec62
-- Type: 21

if mp.get_mpattribute("SCPT:VBSSplit") and mp.get_mpattribute("BM_TEXT_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
