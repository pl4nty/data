-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3abe3d329\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC27: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
  local l_0_0 = nil
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R1 in 'AssignReg'

  local l_0_1 = nil
end
do
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_0 ~= nil and l_0_1 ~= nil then
    local l_0_2 = nil
    local l_0_3 = nil
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

    if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_3) then
      AppendToRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_3, 86400)
      ;
      (bm.trigger_sig)("BM_UnsignedOrAdhocMacBin", l_0_3)
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end

