-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1aeb30d0440cd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
  local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = nil
else
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

    if isTainted(l_0_0, "remote_file_created_taint") or isTainted(l_0_0, "masqueraded_file_extension_taint") then
      (bm.add_related_file)(l_0_0)
      addRelatedProcess()
      reportRelatedBmHits()
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

