-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\100b38d5fac15\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (bm.add_related_string)("file_metadata", l_0_0, bm.RelatedStringBMReport)
  reportRelatedBmHits()
  addRelatedProcess()
  local l_0_5, l_0_6 = , (bm.get_process_relationships)()
  for l_0_10,l_0_11 in ipairs(R4_PC34) do
    local l_0_7 = nil
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", R7_PC40.ppid)
  end
  return mp.INFECTED
end

