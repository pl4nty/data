-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAWhatsapp_IOAV\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
do
  do
    if (l_0_0 == "" or l_0_0 == nil) and (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
      local l_0_1 = (mp.GetMOTWZone)()
      if l_0_1 == 3 or l_0_1 == 4 then
        l_0_0 = (mp.GetMOTWHostUrl)()
      end
    end
    if l_0_0 == nil or l_0_0 == "" then
      return mp.CLEAN
    end
    l_0_0 = (string.lower)(l_0_0)
    if l_0_0 == "https://web.whatsapp.com/" then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

