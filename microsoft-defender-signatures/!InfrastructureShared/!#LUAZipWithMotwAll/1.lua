-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAZipWithMotwAll\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON))
local l_0_1 = nil
local l_0_2 = "iexplore.exe|browser_broker.exe|firefox.exe|chrome.exe|msedge.exe|opera.exe|safari.exe|microsoftedge.exe|microsoftedgecp.exe"
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE or l_0_0 == mp.SCANREASON_UNKNOWN then
  local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_3 then
    l_0_3 = (string.lower)(l_0_3)
    l_0_1 = (string.find)(l_0_2, l_0_3)
  else
    local l_0_4 = (mp.IOAVGetProcessPath)()
    if l_0_4 then
      local l_0_5 = l_0_4:match("([^\\]+)$")
      l_0_1 = (string.find)(l_0_2, (string.lower)(l_0_5), 1, true)
    end
  end
  do
    do
      if l_0_1 then
        (mp.UfsSetMetadataBool)("LUA:ZipWithMotwAll", true)
        return mp.INFECTED
      end
      do
        if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
          local l_0_6 = (mp.GetMOTWZone)()
          if l_0_6 and l_0_6 >= 3 then
            (mp.UfsSetMetadataBool)("LUA:ZipWithMotwAll", true)
            return mp.INFECTED
          end
        end
        return mp.CLEAN
      end
    end
  end
end

