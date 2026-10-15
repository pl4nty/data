-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f8b33be92fb1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true
l_0_1["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true
l_0_1["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true
l_0_1["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[3]).matched then
  l_0_2 = "IisWorkerWebshellDrop.A"
else
  if (this_sigattrlog[4]).matched then
    l_0_2 = "SuspIisWorkerSpawn.AM"
  else
    if (this_sigattrlog[5]).matched then
      l_0_2 = "BM_BLOCKPROCESSCREATE"
    else
      return mp.CLEAN
    end
  end
end
;
(bm.add_related_string)("dur_taint_trigger", l_0_2, bm.RelatedStringBMReport)
;
(bm.add_related_string)("dur_taint_sp_ctx", tostring(IsSharepointServer()), bm.RelatedStringBMReport)
;
(bm.add_related_string)("dur_taint_exch_ctx", tostring(IsExchangeServer()), bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1505.003", "TaintedIISInstance", 604800)
AddTechniqueGlobal("DurableTaintedIisInstance", 604800)
return mp.INFECTED

