-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaArchiveTrackingA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = {}
-- DECOMPILER ERROR at PC20: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC21: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC22: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC23: Overwrote pending register: R4 in 'AssignReg'

if not ("winrar.exe")("7zg.exe", "7za.exe") then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC36: Overwrote pending register: R5 in 'AssignReg'

local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, ("7z.exe").FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_3 == nil then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC57: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R7 in 'AssignReg'

if not IsKeyValuePairInRollingQueue("CC_filelist", "winzip64.exe", "winzip32.exe") then
  local l_0_4, l_0_5 = pcall(mp.GetMOTWHostUrl)
  local l_0_6, l_0_7 = pcall(mp.GetMOTWReferrerUrl)
  if IsCommonFileSharingURL(l_0_5) or IsWebmailDownloadURL(l_0_5) or IsWebmailDownloadURL(l_0_7) then
    return mp.CLEAN
  end
  do
    local l_0_8 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R8 in 'UnsetPending'

    local l_0_9 = (MpCommon.PathToWin32Path)(l_0_8)
    l_0_9 = l_0_9:lower()
    local l_0_10 = l_0_9 .. "\\" .. l_0_0
    local l_0_11 = (MpCommon.GetCurrentTimeT)()
    local l_0_12 = 31536000
    local l_0_13 = (mp.getfilesize)()
    local l_0_14 = {}
    l_0_14.type = "WARCH"
    l_0_14.ProcessImagePath = l_0_10
    l_0_14.ProcessPID = l_0_3
    l_0_14.timestamp = l_0_11
    l_0_14.FileName = l_0_2
    l_0_14.FileSize = l_0_13
    do
      l_0_14.motwhosturl = l_0_5 or ""
      l_0_14.parent = ""
      l_0_14.motwreferrerurl = ""
      l_0_14.score = 1
      AppendToRollingQueue("CC_filelist", l_0_2, safeJsonSerialize(l_0_14), l_0_12, 32)
      local l_0_16 = nil
      if not IsKeyValuePairInRollingQueue("ArchivesWithMotW", l_0_16, l_0_2) then
        local l_0_17 = nil
        local l_0_18 = 600
        AppendToRollingQueue(l_0_17, l_0_16, l_0_2, l_0_18, 32, 0)
        ;
        (mp.set_mpattribute)("MpDisableCaching")
        return mp.INFECTED
      end
      do
        do
          do return mp.CLEAN end
          -- DECOMPILER ERROR at PC166: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

