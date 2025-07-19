-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaToolPaneRequest\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
do
  if l_0_0 and l_0_1 ~= nil and (string.find)(l_0_1, "/_layouts/15/ToolPane.aspx", 1, true) ~= nil then
    local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
    if l_0_2 ~= nil then
      TT_SendBMSigTrigger(l_0_2, "ToolPaneReq", l_0_1)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

