-- Threat: !InfrastructureShared
-- Name: f7b3610e08c0
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= "" and l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.trigger_sig("ArchiveCollectionFromScriptInSuspLocation", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
