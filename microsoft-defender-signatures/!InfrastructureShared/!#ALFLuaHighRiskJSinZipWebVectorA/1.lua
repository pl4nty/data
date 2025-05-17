-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLuaHighRiskJSinZipWebVectorA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON))
local l_0_1 = nil
local l_0_2 = "iexplore.exe|browser_broker.exe|firefox.exe|chrome.exe|msedge.exe|opera.exe|safari.exe|microsoftedge.exe|microsoftedgecp.exe"
local l_0_3 = nil
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE or l_0_0 == mp.SCANREASON_UNKNOWN then
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_4 then
    l_0_4 = (string.lower)(l_0_4)
    l_0_1 = (string.find)(l_0_2, l_0_4)
  else
    local l_0_5 = (mp.IOAVGetProcessPath)()
    if l_0_5 then
      local l_0_6 = l_0_5:match("([^\\]+)$")
      l_0_1 = (string.find)(l_0_2, (string.lower)(l_0_6))
      l_0_3 = (mp.IOAVGetDownloadUrl)()
    end
  end
else
  do
    do
      if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
        local l_0_7 = (mp.GetMOTWZone)()
        l_0_1 = l_0_7 == 3 or l_0_7 == 4
        if l_0_1 then
          l_0_3 = (mp.GetMOTWHostUrl)()
        end
      end
      if not l_0_1 then
        return mp.CLEAN
      end
      if not l_0_3 then
        return mp.CLEAN
      end
      local l_0_8 = {}
      l_0_8.SIG_CONTEXT = "SINGLE_SCRIPT"
      l_0_8.TAG = "INTERFLOW"
      local l_0_9 = SafeGetUrlReputation
      local l_0_10 = {}
      -- DECOMPILER ERROR at PC95: No list found for R6 , SetList fails

      -- DECOMPILER ERROR at PC96: Overwrote pending register: R7 in 'AssignReg'

      l_0_9 = l_0_9(l_0_10, l_0_3, false, 2000)
      if l_0_9 then
        l_0_10 = l_0_9.urls
        l_0_10 = l_0_10[l_0_3]
        if l_0_10 then
          l_0_10 = l_0_9.urls
          l_0_10 = l_0_10[l_0_3]
          l_0_10 = l_0_10.determination
          if l_0_10 == 1 then
            l_0_10 = mp
            l_0_10 = l_0_10.CLEAN
            return l_0_10
          end
        end
      end
      l_0_10 = mp
      l_0_10 = l_0_10.getfilename
      l_0_10 = l_0_10((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
      if l_0_10 == nil then
        return mp.CLEAN
      end
      do
        local l_0_11 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
        if l_0_11 == nil then
          return mp.CLEAN
        end
        l_0_11 = (string.lower)((MpCommon.PathToWin32Path)(l_0_11))
        if l_0_11 == nil then
          return mp.CLEAN
        end
        if l_0_11:find("^:\\program files\\", 2) or l_0_11:find("^:\\program files %(x86%)\\", 2) or l_0_11:find("^:\\windows\\", 2) or l_0_11:find("^:\\voyagerbackups\\", 2) or l_0_11:find("^:\\backup hta-prod-ta\\", 2) or l_0_11:find("^:programdata\\hp\\rs\\data\\backup\\") then
          return mp.CLEAN
        end
        ;
        (mp.set_mpattribute)("MpDisableCaching")
        ;
        (MpCommon.AppendPersistContext)(l_0_11, "Lua:LuaHighRiskJSinZipWebVector.A", 0)
        AppendToRollingQueue("LuaHighRiskJSinZipWebVector", l_0_10, l_0_11)
        do return mp.INFECTED end
        -- DECOMPILER ERROR: 10 unprocessed JMP targets
      end
    end
  end
end

