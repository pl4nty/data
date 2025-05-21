-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\246b3bffc71db\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if MpCommon.SECURITY_MANDATORY_HIGH_RID <= l_0_0.integrity_level then
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC38: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC41: Overwrote pending register: R3 in 'AssignReg'

  local l_0_2 = (("wscript.exe").GetProcessElevationAndIntegrityLevel)("cscript.exe")
  -- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R5 in 'AssignReg'

  if l_0_2 and next("regsvr32.exe") and l_0_2.IntegrityLevel and MpCommon.SECURITY_MANDATORY_HIGH_RID <= l_0_2.IntegrityLevel and IsProcNameInParentProcessTree("BM", "mshta.exe") then
    local l_0_3 = nil
    if not (this_sigattrlog[5]).matched or not ((sysio.GetLastResult)()).Success then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC93: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC94: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC95: Overwrote pending register: R8 in 'AssignReg'

    if (sysio.GetFileSize)(l_0_3) <= 65536 or not 65536 then
      local l_0_6 = nil
      if not ((sysio.GetLastResult)()).Success then
        return mp.CLEAN
      end
      local l_0_7 = nil
      local l_0_8 = tostring((sysio.ReadFile)("vbc.exe", "msbuild.exe", "wmic.exe"))
      -- DECOMPILER ERROR at PC111: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC112: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC113: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC114: Overwrote pending register: R12 in 'AssignReg'

      local l_0_9 = {"I\000n\000j\000e\000c\000t\000D\000l\000l\000", "cmstp.exe", "regasm.exe", "installutil.exe", "regsvcs.exe"}
      do
        do
          local l_0_10 = {"¸W\000\a\128\195", "1ÀÃ", "H1ÀÃ"}
          -- DECOMPILER ERROR at PC126: Overwrote pending register: R13 in 'AssignReg'

          if (string.find)(l_0_8, "sdbf", "msxsl.exe", true) ~= nil and (string.find)(l_0_8, "a\000m\000s\000i\000.\000d\000l\000l", 1, true) ~= nil then
            if (function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if l_1_0:find(l_1_6, 1, true) then
      return true
    end
  end
  return false
end
)(l_0_8, l_0_9) then
              (bm.add_related_string)("[=>] FIX_IDS: ", tostring(l_0_9), bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_0_0.command_line, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
            -- DECOMPILER ERROR at PC165: Confused about usage of register: R9 in 'UnsetPending'

            if (function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if l_1_0:find(l_1_6, 1, true) then
      return true
    end
  end
  return false
end
)(l_0_8, l_0_10) then
              (bm.add_related_string)("[=>] FIX_IDS: ", tostring(l_0_10), bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_0_0.command_line, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
          end
          do return mp.CLEAN end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end

