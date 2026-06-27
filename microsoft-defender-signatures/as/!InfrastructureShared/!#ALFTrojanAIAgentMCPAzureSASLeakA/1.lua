-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIAgentMCPAzureSASLeakA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_mpattribute)("Lua:FnameAttr!mcp.json")
local l_0_2 = (mp.get_mpattribute)("Lua:FnameAttr!claude_desktop_config.json")
local l_0_3 = (mp.get_mpattribute)("Lua:FnameAttr!openclaw.json")
if not l_0_1 and not l_0_2 and not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilesize)()
if l_0_4 < 50 or l_0_4 > 524288 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_5 = tostring((mp.readfile)(0, l_0_4))
;
(mp.readprotection)(true)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = (string.lower)(l_0_5)
if not (string.find)(l_0_6, "mcpservers", 1, true) and not (string.find)(l_0_6, "\"servers\"", 1, true) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_6, "blob.core.windows.net", 1, true) and not (string.find)(l_0_6, "file.core.windows.net", 1, true) and not (string.find)(l_0_6, "queue.core.windows.net", 1, true) then
    local l_0_7 = (string.find)(l_0_6, "table.core.windows.net", 1, true)
  end
  -- DECOMPILER ERROR at PC126: Confused about usage of register: R7 in 'UnsetPending'

  if not l_0_7 then
    return mp.CLEAN
  end
  do
    if ((not (string.find)(l_0_5, "?sv=", 1, true) or (string.find)(l_0_5, "&sig=", 1, true)) and not (string.find)(l_0_5, "&se=", 1, true)) or (string.find)(l_0_5, "&sp=", 1, true) then
      local l_0_8 = nil
    end
    if 0 + 1 + 1 + 1 + 1 < 3 then
      return mp.CLEAN
    end
    if (string.find)(l_0_6, "<your-sas-token>", 1, true) or (string.find)(l_0_6, "your_sas_token", 1, true) or (string.find)(l_0_6, "example.blob.core", 1, true) then
      return mp.CLEAN
    end
    local l_0_9 = nil
    local l_0_10 = nil
    do
      set_research_data("AIAgent_MCPAzureSASLeak", safeJsonSerialize({file = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)) or "unknown", sas_param_count = tostring(l_0_10)}), false)
      ;
      (mp.SetDetectionString)(safeJsonSerialize({file = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)) or "unknown", sas_param_count = tostring(l_0_10)}))
      do return mp.INFECTED end
      -- DECOMPILER ERROR at PC241: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

