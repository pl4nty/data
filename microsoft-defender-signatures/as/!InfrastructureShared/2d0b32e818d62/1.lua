-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2d0b32e818d62\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC14: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[10]).matched and not isnull((this_sigattrlog[10]).utf8p2) then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC46: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[11]).matched or isnull((this_sigattrlog[11]).utf8p2) or (this_sigattrlog[12]).matched) and not isnull((this_sigattrlog[12]).utf8p2) then
      local l_0_1, l_0_2, l_0_3, l_0_4 = (this_sigattrlog[11]).utf8p2
    else
    end
    if not (this_sigattrlog[13]).matched or isnull((this_sigattrlog[13]).utf8p2) or isnull((this_sigattrlog[13]).utf8p2) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_5, l_0_6 = , pcall(mp.GetExecutablesFromCommandLine, (this_sigattrlog[13]).utf8p2)
    if not l_0_6 or isnull(R4_PC80) or #mp.GetExecutablesFromCommandLine < 2 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC91: Overwrote pending register: R4 in 'AssignReg'

    local l_0_7, l_0_8 = , pcall(R4_PC80, (mp.GetExecutablesFromCommandLine)[#mp.GetExecutablesFromCommandLine])
    -- DECOMPILER ERROR at PC109: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC115: Overwrote pending register: R6 in 'AssignReg'

    if isnull(R6_PC97) or (string.find)(R6_PC97, "mshta%.exe$") or not (sysio.IsFileExists)(R6_PC97) or not (mp.IsKnownFriendlyFile)(R6_PC97, false, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC126: Overwrote pending register: R6 in 'AssignReg'

    ;
    (bm.add_related_string)(R6_PC97, R7_PC130, bm.RelatedStringBMReport)
    -- DECOMPILER ERROR at PC133: Overwrote pending register: R6 in 'AssignReg'

    ;
    (bm.add_related_file)(R6_PC97)
    -- DECOMPILER ERROR at PC137: Overwrote pending register: R6 in 'AssignReg'

    ;
    (mp.TriggerScanResource)(R6_PC97, R7_PC130)
    return mp.INFECTED
  end
end

