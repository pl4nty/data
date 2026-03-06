-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanAIMCPMpTestOdrMcpStream\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_ODR_MCPSTREAM then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_MCP_CLIENT_PKG_ID)
if l_0_1 == nil or l_0_1 ~= "com.mptest.odrmcp.client" then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_MCP_SERVER_PKG_ID)
if l_0_2 == nil or l_0_2 ~= "com.mptest.odrmcp.server" then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_MCP_SERVER_NAME)
if l_0_3 == nil or l_0_3 ~= "22d0d82a-6d02-46f1-8f75-cbb2b84a33c2" then
  return mp.CLEAN
end
return mp.INFECTED

