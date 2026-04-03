-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\67bb3436c7882\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if l_0_0.DeviceRoles then
    local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_2 = false
    local l_0_3 = {}
    if IsProcNameInParentProcessTree("BM", "wsmprovhost.exe") then
      l_0_2 = true
      l_0_3.Parent = "wsmprovhost.exe"
    else
      local l_0_4 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSIsRemoteSession)
      if MpCommon.QuerySessionInformation then
        l_0_2 = true
        l_0_3.Parent = "RemoteSession"
      end
    end
    do
      if l_0_2 then
        l_0_3.SigName = "WsmMonitorForChange"
        local l_0_5, l_0_6 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSDomainName)
        do
          if l_0_5 and l_0_6 and l_0_6 ~= "" then
            local l_0_7 = scrubData(l_0_6)
            l_0_3.DomainName = tostring(l_0_7)
          end
          local l_0_8, l_0_9 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSUserName)
          do
            if l_0_8 and l_0_9 and l_0_9 ~= "" then
              local l_0_10 = scrubData(l_0_9)
              l_0_3.UserName = tostring(l_0_10)
            end
            local l_0_11, l_0_12 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSClientAddress)
            do
              do
                if l_0_11 and l_0_12 and l_0_12 ~= "" then
                  local l_0_13 = scrubData(l_0_12)
                  l_0_3.IP = tostring(l_0_13)
                end
                ;
                (bm.add_related_string)("HVASessionInfo", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
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

