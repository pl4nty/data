-- Threat: !InfrastructureShared
-- Name: !#Lua:AIPrompt:AIScan
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ODR_MCPSTREAM then
  mp.set_mpattribute("MpIsAiMcpODRScan")
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_MCP_CLIENT_PKG_ID)
  if l_0_1 ~= nil then
    mp.set_mpattributeex("MpODR_MCP_CLIENT_PKG_ID", l_0_1)
  end
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_MCP_SERVER_PKG_ID)
  if l_0_2 ~= nil then
    mp.set_mpattributeex("MpODR_MCP_SERVER_PKG_ID", l_0_2)
  end
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_MCP_SERVER_NAME)
  if l_0_3 ~= nil then
    mp.set_mpattributeex("MpODR_MCP_SERVER_NAME", l_0_3)
  end
end
if l_0_0 == mp.SCANREASON_NET_PROMPTSTREAM then
  mp.set_mpattribute("MpIsAiNetPromptScan")
  local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
  if l_0_4 == nil then
    mp.set_mpattributeex("MpNetPromptFramework", l_0_4)
  end
end
return mp.CLEAN
