-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f8b33be92fb1\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[3]).matched then
  l_0_0 = "IisWorkerWebshellDrop.A"
else
  if (this_sigattrlog[4]).matched then
    l_0_0 = "SuspIisWorkerSpawn.AM"
  else
    if (this_sigattrlog[5]).matched then
      l_0_0 = "BM_BLOCKPROCESSCREATE"
    else
      return mp.CLEAN
    end
  end
end
;
(bm.add_related_string)("dur_taint_trigger", l_0_0, bm.RelatedStringBMReport)
;
(bm.add_related_string)("dur_taint_sp_ctx", tostring(IsSharepointServer()), bm.RelatedStringBMReport)
;
(bm.add_related_string)("dur_taint_exch_ctx", tostring(IsExchangeServer()), bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1505.003", "TaintedIISInstance", 604800)
AddTechniqueGlobal("DurableTaintedIisInstance", 604800)
return mp.INFECTED

