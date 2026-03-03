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
if not l_0_1 and not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilesize)()
if l_0_3 < 50 or l_0_3 > 524288 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_4 = tostring((mp.readfile)(0, l_0_3))
;
(mp.readprotection)(true)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = (string.lower)(l_0_4)
if not (string.find)(l_0_5, "mcpservers", 1, true) and not (string.find)(l_0_5, "\"servers\"", 1, true) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_5, "blob.core.windows.net", 1, true) and not (string.find)(l_0_5, "file.core.windows.net", 1, true) and not (string.find)(l_0_5, "queue.core.windows.net", 1, true) then
    local l_0_6 = (string.find)(l_0_5, "table.core.windows.net", 1, true)
  end
  -- DECOMPILER ERROR at PC120: Confused about usage of register: R6 in 'UnsetPending'

  if not l_0_6 then
    return mp.CLEAN
  end
  do
    if ((not (string.find)(l_0_4, "?sv=", 1, true) or (string.find)(l_0_4, "&sig=", 1, true)) and not (string.find)(l_0_4, "&se=", 1, true)) or (string.find)(l_0_4, "&sp=", 1, true) then
      local l_0_7 = nil
    end
    if 0 + 1 + 1 + 1 + 1 < 3 then
      return mp.CLEAN
    end
    if (string.find)(l_0_5, "<your-sas-token>", 1, true) or (string.find)(l_0_5, "your_sas_token", 1, true) or (string.find)(l_0_5, "example.blob.core", 1, true) then
      return mp.CLEAN
    end
    local l_0_8 = nil
    local l_0_9 = nil
    do
      ;
      (mp.SetDetectionString)(safeJsonSerialize({file = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)) or "unknown", sas_param_count = tostring(l_0_9)}))
      do return mp.INFECTED end
      -- DECOMPILER ERROR at PC229: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

