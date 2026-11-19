-- Threat: !InfrastructureShared
-- Name: 2329bf573add
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
