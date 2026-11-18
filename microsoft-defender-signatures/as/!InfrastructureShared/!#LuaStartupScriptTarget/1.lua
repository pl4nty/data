-- Threat: !InfrastructureShared
-- Name: !#Lua:StartupScriptTarget
-- Type: 13
-- MpAttributes: Lua:CloudBlockLevelGT3 & Lua:IsE5Machine & Lua:FileInStartupFolder & LUA:FileSizeLE400.A & !Lua:EXEExt & !Lua:DLLExt & !Lua:CPLExt & !Lua:SYSExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 3 or string.find(l_0_0, ".", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = {
  bat = 372652227,
  cmd = 372652227,
  pif = 2403297657,
  vbe = 4164442607,
  vbs = 4164442607,
  [".js"] = 1717357644,
  jse = 1717357644,
  wsh = 291241178,
  wsf = 291241178,
  ps1 = 2287119712,
  hta = 4283801078
}
local l_0_2 = string.sub(l_0_0, -3)
if l_0_2 == nil or #l_0_2 <= 2 or l_0_1[l_0_2] == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_1[l_0_2]
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_4 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_5 = string.lower(tostring(headerpage))
  local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_5)
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
    if sysio.IsFileExists(l_0_8) then
      mp.ReportLowfi(l_0_8, l_0_3)
    end
  end
end
return mp.CLEAN
