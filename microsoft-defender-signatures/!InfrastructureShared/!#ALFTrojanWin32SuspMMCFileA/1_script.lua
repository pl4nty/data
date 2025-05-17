-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32SuspMMCFileA\1_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 1048576 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)()
if l_0_1 then
  l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
end
if not l_0_1 then
  _ = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
end
do
  local l_0_3 = l_0_1 or ""
  local l_0_4 = nil
  if l_0_0 > 1024 then
    (mp.readprotection)(false)
    -- DECOMPILER ERROR at PC63: Overwrote pending register: R4 in 'AssignReg'

  else
    -- DECOMPILER ERROR at PC71: Overwrote pending register: R4 in 'AssignReg'

  end
  if not nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R4 in 'UnsetPending'

  if not (string.match)(nil, "<StringTables>(.-)</StringTable>") then
    return mp.CLEAN
  end
  local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) or ""
  -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

  local l_0_6 = nil
  do
    if ((string.match)(nil, "<StringTables>(.-)</StringTable>")):match("<String ID=.->({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})</String") then
      local l_0_7 = nil
      AppendToRollingQueue("MMC_SnapInCLSID", "SnapInCLSID", (string.lower)(((string.match)(nil, "<StringTables>(.-)</StringTable>")):match("<String ID=.->({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})</String") .. ";" .. l_0_4 .. ";" .. l_0_5), 1800, 100, 0)
      -- DECOMPILER ERROR at PC115: Confused about usage of register: R7 in 'UnsetPending'

      set_research_data("CLSID", (MpCommon.Base64Encode)(((string.match)(nil, "<StringTables>(.-)</StringTable>")):match("<String ID=.->({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})</String") .. ";" .. l_0_4 .. ";" .. l_0_5), false)
    end
    local l_0_8 = nil
    local l_0_9 = nil
    if l_0_6:match("<String ID=.->(http.-)</String") then
      local l_0_10 = nil
      local l_0_11, l_0_12 = , l_0_6:match("<String ID=.->(http.-)</String") .. ";" .. l_0_4 .. ";" .. l_0_5
      do
        do
          do
            if UrlGrader(l_0_6:match("<String ID=.->(http.-)</String"), "Trojan:Win32/SuspMMCFile.A", false) ~= 0 then
              local l_0_13 = nil
              R13_PC140("URL_info", (MpCommon.Base64Encode)(safeJsonSerialize(R13_PC140)), false)
              -- DECOMPILER ERROR at PC149: Overwrote pending register: R13 in 'AssignReg'

              l_0_12 = R13_PC140 .. ";URL_Grading_Info=" .. safeJsonSerialize(R13_PC140)
            end
            -- DECOMPILER ERROR at PC154: Overwrote pending register: R13 in 'AssignReg'

            AppendToRollingQueue(R13_PC140, "SnapInUrls", (string.lower)(l_0_12), 1800, 100, 0)
            -- DECOMPILER ERROR at PC165: Overwrote pending register: R13 in 'AssignReg'

            set_research_data(R13_PC140, (MpCommon.Base64Encode)(l_0_11), false)
            -- DECOMPILER ERROR at PC174: Confused about usage of register: R8 in 'UnsetPending'

            if l_0_9 or l_0_11 then
              return mp.INFECTED
            end
            do return mp.CLEAN end
            -- DECOMPILER ERROR at PC182: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

