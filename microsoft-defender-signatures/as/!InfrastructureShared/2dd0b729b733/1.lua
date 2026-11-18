-- Threat: !InfrastructureShared
-- Name: 2dd0b729b733
-- Type: 21

if mp.get_mpattribute("BM_OLE_FILE") then
  return mp.INFECTED
end
return mp.LOWFI
