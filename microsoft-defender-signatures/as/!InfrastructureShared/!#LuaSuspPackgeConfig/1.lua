-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspPackgeConfig
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: (SCPT:NpmJson | SCPT:SuspTaskConfig | SCPT:SuspClaudeConfig)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4
local l_0_5 = {}
if mp.get_mpattribute("SCPT:NpmJson") then
  l_0_4 = "npmPackage"
  if l_0_1 ~= "package.json" then
    return mp.CLEAN
  end
  if string.find(l_0_0, "node_modules", 1, true) == nil then
    return mp.CLEAN
  end
  l_0_5 = {
    preinstall = true,
    postinstall = true,
    prepare = true
  }
end
if mp.get_mpattribute("SCPT:SuspTaskConfig") then
  l_0_2 = "vsCodeTask"
elseif mp.get_mpattribute("SCPT:SuspClaudeConfig") then
  l_0_3 = "claudeSettings"
end
if l_0_2 or l_0_3 then
  l_0_5 = {command = true}
end
local l_0_6 = "\"([%w%-]+)\"%s*:%s*\"([^\"]+)"
local l_0_7 = "(?i)(?:node(?:\\.exe)?\\s+-e\\s*(?:\\\\+)?['\"]?.{50,}|(?:/usr/bin/|/bin/)?(?:sh|bash)\\s+-c\\s*(?!.*yarn\\.lock).*|curl\\s*.*|wget\\s*.*|certutil\\s*.*|powershell\\s*.*|cmd(?:\\.exe)?\\s+/c\\s*.*)"
local l_0_8 = "(?i)^\\s*(?:node|bun)(?:\\.exe)?\\s+(?:run\\s+)?(?:\\.?/)?([\\w/ \\.\\-_]+\\.(?:js|cjs|mjs))"
mp.readprotection(false)
local l_0_9 = mp.getfilesize()
local l_0_10 = mp.readfile(0, l_0_9)
mp.readprotection(true)
l_0_10 = string.gsub(l_0_10, "\\\"", "&quot;")
local l_0_11 = false
local l_0_12, l_0_13, l_0_14
for l_0_15, l_0_16 in string.gmatch(l_0_10, l_0_6) do
  if l_0_15 == "name" then
    l_0_12 = l_0_16
  elseif l_0_15 == "version" then
    l_0_13 = l_0_16
  elseif l_0_15 == "label" then
    l_0_14 = l_0_16
  end
end
for l_0_17, l_0_18 in string.gmatch(l_0_10, l_0_6) do
  if l_0_5[l_0_17] then
    l_0_18 = string.gsub(l_0_18, "&quot;", "\"")
    if MpCommon.StringRegExpSearch(l_0_7, l_0_18) or MpCommon.StringRegExpSearch(l_0_8, l_0_18) then
      l_0_11 = l_0_18
      break
    end
  end
end
if l_0_11 then
  local l_0_19 = {}
  local l_0_20 = l_0_2 or l_0_3 or l_0_4
  if l_0_20 then
    table.insert(l_0_19, l_0_20)
  end
  if l_0_12 then
    table.insert(l_0_19, l_0_12)
  end
  if l_0_13 then
    table.insert(l_0_19, l_0_13)
  end
  if l_0_14 then
    table.insert(l_0_19, l_0_14)
  end
  table.insert(l_0_19, l_0_11)
  l_0_11 = table.concat(l_0_19, ":")
  local l_0_21 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_21 ~= nil then
    TT_SendBMSigTrigger(l_0_21, "JsonPayload", l_0_11)
  end
end
return mp.CLEAN
