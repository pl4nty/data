-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64JugrottoA!dha\1.luac 

-- params : ...
-- function num : 0
do
  if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
    local l_0_0 = (mp.GetMOTWHostUrl)()
    if l_0_0 ~= nil and (string.len)(l_0_0) > 50 and (l_0_0:find("https://green.info/chatting/", 1, true) or l_0_0:find(".v8.pro/chat/", 1, true) or l_0_0:find(".v8.pro/attach/", 1, true)) then
      (mp.set_mpattribute)("//Lua:JugrottoChild")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

