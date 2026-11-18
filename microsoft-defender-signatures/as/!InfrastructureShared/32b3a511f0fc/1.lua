-- Threat: !InfrastructureShared
-- Name: 32b3a511f0fc
-- Type: 21
-- Includes: LuaFuncHelper

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if this_sigattrlog[1].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p1
if not sysio.IsFileExists(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileSize(l_0_0)
if l_0_1 == nil or l_0_1 < 10 or 5120000 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = table.concat({
  "SELECT",
  "json_extract(s.value, '$[0]') AS config_key,",
  "json_extract(s.value, '$[1].serverName') AS server_name,",
  "COUNT(tool.value) AS tool_count,",
  "GROUP_CONCAT(json_extract(tool.value, '$.name'), ', ') AS tool_names",
  "FROM ItemTable t",
  "JOIN json_each(json_extract(t.value, '$.serverTools')) AS s",
  "LEFT JOIN json_each(json_extract(s.value, '$[1].tools')) AS tool",
  "WHERE t.key = 'mcpToolCache'",
  "GROUP BY config_key, server_name;"
}, " ")
local l_0_3 = table.concat({
  "SELECT",
  "CASE t.key",
  "WHEN 'chat.currentLanguageModel.editor' THEN 'editor_model'",
  "WHEN 'chat.currentLanguageModel.panel'  THEN 'panel_model'",
  "END AS key,",
  "t.value",
  "FROM ItemTable t",
  "WHERE t.key IN (",
  "'chat.currentLanguageModel.editor',",
  "'chat.currentLanguageModel.panel'",
  ");"
}, " ")
local l_0_4 = table.concat({
  "SELECT",
  "COALESCE(",
  "  json_extract(t.value, '$.apiModelId'),",
  "  json_extract(t.value, '$.listApiConfigMeta[0].modelId')",
  ") AS model,",
  "COALESCE(",
  "  json_extract(t.value, '$.apiProvider'),",
  "  json_extract(t.value, '$.listApiConfigMeta[0].apiProvider')",
  ") AS provider,",
  "json_extract(t.value, '$.currentApiConfigName') AS config_name",
  "FROM ItemTable t",
  "WHERE t.key = 'RooVeterinaryInc.roo-cline'",
  "AND json_valid(t.value);"
}, " ")
local l_0_5 = table.concat({
  "SELECT",
  "config.key AS app_context,",
  "json_extract(config.value, '$.modelName') AS modelName",
  "FROM ItemTable t,",
  "json_each(",
  "  json_extract(t.value, '$.aiSettings.modelConfig')",
  ") AS config",
  "WHERE",
  "t.key = 'src.vs.platform.reactivestorage.browser.reactiveStorageServiceImpl.persistentStorage.applicationUser'",
  "AND modelName != 'default'",
  "AND modelName IS NOT NULL;"
}, " ")
local l_0_6, l_0_7 = sqlite.open(l_0_0)
if not l_0_6 then
  return mp.CLEAN
end
local l_0_8 = {}
local l_0_9, l_0_10 = sqlite.query(l_0_6, l_0_2)
if l_0_9 and next(l_0_9) then
  l_0_8.mcp_tools = l_0_9
end
local l_0_11, l_0_12 = sqlite.query(l_0_6, l_0_3)
if l_0_11 and next(l_0_11) then
  l_0_8.chat_models = l_0_11
end
local l_0_13, l_0_14 = sqlite.query(l_0_6, l_0_4)
if l_0_13 and next(l_0_13) then
  l_0_8.roo_config = l_0_13
end
local l_0_15, l_0_16 = sqlite.query(l_0_6, l_0_5)
if l_0_15 and next(l_0_15) then
  l_0_8.cursor_models = l_0_15
end
if not next(l_0_8) then
  return mp.CLEAN
end
local l_0_17 = safeJsonSerialize(l_0_8, 260)
if not l_0_17 then
  return mp.CLEAN
end
bm.set_detection_string(l_0_17)
return mp.INFECTED
