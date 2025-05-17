-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanJSFauppodSA\1.luac 

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
      l_0_5 = (string.lower)(l_0_5)
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
      l_0_3 = (string.lower)(l_0_3)
      do
        do
          if l_0_3:find("about:", 1, true) then
            local l_0_8 = (MpCommon.PathToWin32Path)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
            if l_0_8 == nil then
              return mp.CLEAN
            end
            if l_0_8:find("\\downloads\\update", 1, true) or l_0_8:find("\\downloads\\download", 1, true) then
              return mp.INFECTED
            end
          end
          do return mp.CLEAN end
          -- DECOMPILER ERROR: 7 unprocessed JMP targets
        end
      end
    end
  end
end

