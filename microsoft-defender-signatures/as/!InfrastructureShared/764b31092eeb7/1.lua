-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\764b31092eeb7\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = {}
-- DECOMPILER ERROR at PC13: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC14: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("svchost.exe").get_imagepath)()
-- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

if l_0_1 and ("microsoft")("\\installer\\", "\\appdata\\") then
  return mp.CLEAN
end
local l_0_2 = nil
-- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

if ((this_sigattrlog[7]).matched and not (this_sigattrlog[8]).matched) or not l_0_2 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC55: Overwrote pending register: R2 in 'AssignReg'

local l_0_3 = "c:\\\\programdata\\\\microsoft\\\\windows defender.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$|c:\\\\.*\\\\microsoft\\\\windows defender advanced threat protection\\\\.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$"
local l_0_4 = "c:\\\\programdata\\\\microsoft(_bak)?$|c:\\\\program files\\\\windows defender advanced threat protection(_bak)?$"
-- DECOMPILER ERROR at PC58: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = "Windows\\System32\\spoolsv.exe"
if (MpCommon.StringRegExpSearch)(l_0_3, l_0_2) or (MpCommon.StringRegExpSearch)(l_0_4, l_0_2) or (MpCommon.StringRegExpSearch)(l_0_5, l_0_2) then
  (bm.add_related_string)("MDE_Path", l_0_2, bm.RelatedStringBMReport)
  do
    if not add_parents() then
      local l_0_6 = {}
    end
    local l_0_7 = nil
    if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).ppid then
      local l_0_8 = nil
      local l_0_9 = checkParentCmdlineCaseInsensitive
      local l_0_10 = l_0_8.ppid
      local l_0_11 = {}
      -- DECOMPILER ERROR at PC107: No list found for R10 , SetList fails

      -- DECOMPILER ERROR at PC108: Overwrote pending register: R11 in 'AssignReg'

      l_0_9 = l_0_9(l_0_10, l_0_11, {"setup.exe", ""})
      if l_0_9 then
        l_0_9 = mp
        l_0_9 = l_0_9.CLEAN
        return l_0_9
      end
    end
    do
      ;
      (bm.add_related_string)("Parents", safeJsonSerialize(l_0_7), bm.RelatedStringBMReport)
      if not (string.find)(l_0_2, "advanced threat protection", 1, true) then
        (bm.add_related_string)("AV", "True", bm.RelatedStringBMReport)
        l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
        if l_0_1 then
          local l_0_12 = nil
          local l_0_13 = contains
          local l_0_14 = l_0_1
          l_0_13 = l_0_13(l_0_14, {"C:\\ProgramData\\", "C:\\Program Files", "c:\\windows\\"})
          if not l_0_13 then
            l_0_13 = bm
            l_0_13 = l_0_13.trigger_sig
            l_0_14 = "MpTamperPFRO_Susp"
            l_0_13(l_0_14, l_0_2)
          end
        end
      end
      do
        do
          do return mp.INFECTED end
          return mp.CLEAN
        end
      end
    end
  end
end

