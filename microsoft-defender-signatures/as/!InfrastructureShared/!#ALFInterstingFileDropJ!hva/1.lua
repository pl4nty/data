-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFInterstingFileDropJ!hva\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = l_0_1:sub(-3)
local l_0_3 = "ps1|dll|sm1|xml|txt|bak"
if l_0_3:find(l_0_2, 1, true) then
  return mp.CLEAN
end
if l_0_0:match("users\\.-\\appdata\\local\\temp") then
  return mp.CLEAN
end
local l_0_4 = ExtractDeviceProperties()
if l_0_4.DeviceRoles then
  local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if not l_0_5 then
    return mp.CLEAN
  end
  local l_0_6 = {}
  local l_0_7 = "|winrshost.exe|wsmprovhost.exe|"
  local l_0_8, l_0_9 = checkParentProcessNameFromListByPPIDRecursive(l_0_5, l_0_7, 2)
  if not l_0_8 or not l_0_9 then
    local l_0_10, l_0_11 = pcall(MpCommon.QuerySessionInformation, l_0_5, MpCommon.WTSIsRemoteSession)
    if not l_0_10 or not l_0_11 then
      return mp.CLEAN
    end
    l_0_6.isRemote = tostring(l_0_11)
  else
    do
      l_0_6.Parent = l_0_9
      l_0_6.SigName = "InterstingFileDrop"
      local l_0_12, l_0_13 = pcall(MpCommon.QuerySessionInformation, l_0_5, MpCommon.WTSDomainName)
      do
        if l_0_12 and l_0_13 and l_0_13 ~= "" then
          local l_0_14 = scrubData(l_0_13)
          l_0_6.DomainName = tostring(l_0_14)
        end
        local l_0_15, l_0_16 = pcall(MpCommon.QuerySessionInformation, l_0_5, MpCommon.WTSUserName)
        do
          if l_0_15 and l_0_16 and l_0_16 ~= "" then
            local l_0_17 = scrubData(l_0_16)
            l_0_6.UserName = tostring(l_0_17)
          end
          local l_0_18, l_0_19 = pcall(MpCommon.QuerySessionInformation, l_0_5, MpCommon.WTSClientAddress)
          do
            if l_0_18 and l_0_19 and l_0_19 ~= "" then
              local l_0_20 = scrubData(l_0_19)
              l_0_6.IP = tostring(l_0_20)
            end
            local l_0_21, l_0_22 = pcall(MpCommon.QuerySessionInformation, l_0_5, MpCommon.WTSClientName)
            do
              do
                if l_0_21 and l_0_22 and l_0_22 ~= "" then
                  local l_0_23 = scrubData(l_0_22)
                  l_0_6.ClientName = tostring(l_0_23)
                end
                set_research_data("HVASessionInfo", safeJsonSerialize(l_0_6), false)
                do return mp.INFECTED end
                return mp.CLEAN
              end
            end
          end
        end
      end
    end
  end
end

