-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db3d74a0f9e\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil, nil
  end
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
      local l_0_2 = nil
    end
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_2 == nil or (string.lower)((this_sigattrlog[2]).utf8p2) == nil then
      return mp.CLEAN
    end
    local l_0_3 = nil
    local l_0_4 = nil
    if bm_AddRelatedFileFromCommandLine(l_0_3) == nil then
      return mp.CLEAN
    end
    for l_0_8,l_0_9 in ipairs(bm_AddRelatedFileFromCommandLine(l_0_3)) do
      local l_0_5, l_0_6 = (this_sigattrlog[2]).image_path
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R8 in 'UnsetPending'

      if R8_PC56 ~= nil and R8_PC56 ~= "" and (StringEndsWith(R8_PC56, ".cmd") or StringEndsWith(R8_PC56, ".bat")) then
        R8_PC56 = R8_PC56:lower()
        if (sysio.IsFileExists)(R8_PC56) and IsKeyInRollingQueue("CC_filelist", R8_PC56, true) then
          AppendToRollingQueue("CC_filelist", l_0_5, safeJsonSerialize({type = "PLCMD", ProcessImagePath = l_0_5, ProcessPID = (this_sigattrlog[2]).ppid, ProcessCmd = l_0_4, parent = (this_sigattrlog[1]).ppid, score = 4}), 31536000, 32)
          local l_0_12 = nil
          -- DECOMPILER ERROR at PC118: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC121: Confused about usage of register: R11 in 'UnsetPending'

          if GetTrackingDataForFile(l_0_11, {}) and {} ~= nil then
            (bm.add_related_string)("CC_filelist", safeJsonSerialize({}), bm.RelatedStringBMReport)
          end
        end
      end
    end
    return mp.INFECTED
  end
end

