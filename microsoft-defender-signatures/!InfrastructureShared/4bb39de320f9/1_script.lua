-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4bb39de320f9\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  if bm_AddRelatedFileFromCommandLine(l_0_0) == nil then
    return mp.CLEAN
  end
  for l_0_6,l_0_7 in ipairs(bm_AddRelatedFileFromCommandLine(l_0_0)) do
    local l_0_3 = nil
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

    if R6_PC34 ~= nil and R6_PC34 ~= "" and (StringEndsWith(R6_PC34, ".js") or StringEndsWith(R6_PC34, ".vbs")) then
      R6_PC34 = R6_PC34:lower()
      -- DECOMPILER ERROR at PC73: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC76: Confused about usage of register: R7 in 'UnsetPending'

      if (sysio.IsFileExists)(R6_PC34) and IsKeyInRollingQueue("CC_filelist", R6_PC34, true) and GetTrackingDataForFile(l_0_8, {}) and {} ~= nil then
        (bm.add_related_string)("CC_filelist", safeJsonSerialize({}), bm.RelatedStringBMReport)
      end
    end
  end
  return mp.INFECTED
end

