-- Threat: !InfrastructureShared
-- Name: 1529fd9793df
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
mp.set_mpattribute("SCRIPT:Regsvr32")
return mp.CLEAN
