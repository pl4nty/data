-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64MidMessA!dha\0x00001918_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 16777216 then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  do
    if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
      local l_0_1 = (mp.GetMOTWHostUrl)()
      if l_0_1 ~= nil and (string.len)(l_0_1) > 50 and l_0_1:find("www.outputmessenger.com/OutputMessengerSetup_64bit.zip", 1, true) then
        return mp.INFECTED
      end
    end
    if (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)) == "outputmessengersetup_64bit.exe" then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

