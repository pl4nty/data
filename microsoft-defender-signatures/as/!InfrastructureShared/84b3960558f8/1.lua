-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3960558f8\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
  else
  end
  if not (this_sigattrlog[3]).matched or this_sigattrlog[3] == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  if (this_sigattrlog[3]).utf8p1 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_5 = nil
  if (string.find)((string.lower)((this_sigattrlog[3]).utf8p1), "\\windows\\", 1, true) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)((string.lower)((this_sigattrlog[3]).utf8p1))
  TrackPidAndTechniqueBM("BM", "T1037.001", "sysvol_logon_script_payload")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end

