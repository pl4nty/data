-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2d0b32e818d62\0x000006d0_luac 

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
    -- DECOMPILER ERROR at PC92: Overwrote pending register: R4 in 'AssignReg'

    local l_0_7 = nil
    -- DECOMPILER ERROR at PC94: Overwrote pending register: R4 in 'AssignReg'

    R4_PC80 = R4_PC80((mp.ContextualExpandEnvironmentVariables)(R4_PC80))
    if not R4_PC80 then
      R4_PC80 = string
      R4_PC80 = R4_PC80.find
      R4_PC80 = R4_PC80((mp.ContextualExpandEnvironmentVariables)(R4_PC80), "mshta%.exe$")
      if not R4_PC80 then
        R4_PC80 = sysio
        R4_PC80 = R4_PC80.IsFileExists
        R4_PC80 = R4_PC80((mp.ContextualExpandEnvironmentVariables)(R4_PC80))
        if R4_PC80 then
          R4_PC80 = mp
          R4_PC80 = R4_PC80.IsKnownFriendlyFile
          R4_PC80 = R4_PC80((mp.ContextualExpandEnvironmentVariables)(R4_PC80), false, true)
        end
      end
    end
    if not R4_PC80 then
      R4_PC80 = mp
      R4_PC80 = R4_PC80.CLEAN
      return R4_PC80
    end
    R4_PC80 = bm
    R4_PC80 = R4_PC80.add_related_string
    R4_PC80("MSHTA_ExecSignedPE", (mp.ContextualExpandEnvironmentVariables)(R4_PC80), bm.RelatedStringBMReport)
    R4_PC80 = bm
    R4_PC80 = R4_PC80.add_related_file
    R4_PC80((mp.ContextualExpandEnvironmentVariables)(R4_PC80))
    R4_PC80 = mp
    R4_PC80 = R4_PC80.TriggerScanResource
    R4_PC80("file", (mp.ContextualExpandEnvironmentVariables)(R4_PC80))
    R4_PC80 = mp
    R4_PC80 = R4_PC80.INFECTED
    return R4_PC80
  end
end

