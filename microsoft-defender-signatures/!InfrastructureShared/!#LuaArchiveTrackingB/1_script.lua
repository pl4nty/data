-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaArchiveTrackingB\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 == nil or not IsKeyInRollingQueue("ArchivesWithMotW", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = "FilesFromArchiveswithMotw"
local l_0_4 = (MpCommon.PathToWin32Path)(l_0_0 .. "\\" .. l_0_1)
if IsKeyInRollingQueue(l_0_3, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = GetRollingQueueKeyValues("ArchivesWithMotW", l_0_2)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = nil
for l_0_10,l_0_11 in ipairs(l_0_5) do
  local l_0_12 = (l_0_11.value):match("([^\\]+)%.")
  if l_0_0:find(l_0_12, 1, true) ~= nil then
    do
      do
        l_0_6 = l_0_11.value
        do break end
        -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_13 = 600
AppendToRollingQueue(l_0_3, l_0_4, l_0_6, l_0_13, 32)
if IsKeyInRollingQueue("CC_filelist", l_0_6) then
  local l_0_14, l_0_15 = pcall(mp.GetMOTWHostUrl)
  local l_0_16, l_0_17 = pcall(mp.GetMOTWReferrerUrl)
  do
    local l_0_18 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
    do
      local l_0_20 = nil
      -- DECOMPILER ERROR at PC129: Confused about usage of register: R12 in 'UnsetPending'

      local l_0_19 = (MpCommon.PathToWin32Path)(l_0_20)
      local l_0_21 = ((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) or ""):lower()
      local l_0_22 = l_0_19 .. "\\" .. l_0_21
      local l_0_23 = (MpCommon.GetCurrentTimeT)()
      local l_0_24 = 31536000
      local l_0_25 = (mp.getfilesize)()
      local l_0_26 = {}
      l_0_26.type = "EFMRU"
      l_0_26.ProcessImagePath = l_0_22
      l_0_26.ProcessPID = l_0_2
      l_0_26.timestamp = l_0_23
      l_0_26.FileName = l_0_4
      l_0_26.FileSize = l_0_25
      do
        do
          l_0_26.motwhosturl = l_0_15 or ""
          l_0_26.parent = l_0_6
          l_0_26.motwreferrerurl = l_0_17 or ""
          l_0_26.score = 1
          ;
          (mp.set_mpattribute)("BM_FilesFromArchivesWithMotw")
          AppendToRollingQueue("CC_filelist", l_0_4, safeJsonSerialize(l_0_26), l_0_24, 32)
          ;
          (mp.set_mpattribute)("MpDisableCaching")
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC186: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

