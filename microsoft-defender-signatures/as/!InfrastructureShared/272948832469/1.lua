-- Threat: !InfrastructureShared
-- Name: 272948832469
-- Type: 21
-- Includes: LuaFuncHelper, ResearchData, BMLuaLib, AppomalyHelpers

local l_0_0 = mp.GetBruteMatchData()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
if l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  ":\\saw\\system\\sawhealthcheck.ps1$",
  ":\\saw\\user\\sawhealthcheck.ps1$",
  "\\microsoft intune management extension\\policies\\scripts\\",
  ":\\windows\\imecache\\healthscripts\\.+%.ps1$",
  "\\vdi_scripts\\defenderatp\\defenderatp.ps1$",
  ":\\agent\\enableagent.ps1$",
  ":\\programdata\\amazon\\ssm\\.+\\runpowershellscript\\_script.ps1$",
  ":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$",
  ":\\work\\cloudtest\\preconfig.cmd$",
  "%w\\bin\\defender%-exclusions.ps1$",
  ":\\packages\\plugins\\microsoft."
}
local l_0_3 = mp.getfilename()
if l_0_3 then
  l_0_3 = MpCommon.PathToWin32Path(l_0_3)
  if l_0_3 and contains(string.lower(l_0_3), l_0_2, false) then
    return mp.CLEAN
  end
end
local l_0_4, l_0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_5 and contains(string.lower(l_0_5), l_0_2, false) then
  return mp.CLEAN
end
l_0_1 = l_0_1:gsub("<#.-#>", "")
local l_0_6, l_0_7 = MpCommon.StringRegExpSearch("((?:set|add)-mppreference\\s+-exclusion.+?(?:;|\\||<|>|$))", l_0_1:sub(l_0_0.match_offset - 3))
if l_0_6 then
  local l_0_8 = 1
  local l_0_9 = ""
  local l_0_10 = mp.getfilename()
  l_0_10 = l_0_10:gsub("%-%>%(UTF%-16LE%)", ""):lower()
  for l_0_11, l_0_12 in l_0_7:gsub("-exclusion", ";"):gmatch("(%w+)%s+([^;]+)") do
    if l_0_12:sub(1, 2) == "@(" then
      l_0_12 = l_0_12:match("^@%((.-)%)")
    end
    for l_0_13 in string.gmatch(l_0_12, "([^,]+)") do
      l_0_13 = l_0_13:match("^%s*(.-)%s*$")
      if l_0_13:sub(1, 1) == "'" or l_0_13:sub(1, 1) == "\"" then
        l_0_13 = l_0_13:match("^['\"](.-)['\"]")
      else
        l_0_13 = l_0_13:match("^%S+")
      end
      if l_0_13:sub(1, 5) == "$env:" then
        l_0_13 = "%" .. l_0_13:sub(6) .. "%"
      end
      local l_0_14 = l_0_11 .. "|" .. l_0_13
      local l_0_15 = "(%systemdrive%)$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(c:(\\\\*)?\\*?%?$)"
      local l_0_16, l_0_17 = MpCommon.StringRegExpSearch(l_0_15, l_0_14)
      if l_0_16 then
        l_0_8 = l_0_8 + 20
        l_0_9 = l_0_9 .. ";" .. l_0_14
      else
        l_0_15 = "(%userprofile%|%programdata%|%appdata%|%localappdata%|%windir%|%programfiles(x86)%|%programfiles%)$|(c:\\\\users\\\\.*\\\\(documents|downloads|pictures|music|videos))$|(\\w:(\\\\*)?\\*?%?$)"
        l_0_16, l_0_17 = MpCommon.StringRegExpSearch(l_0_15, l_0_14)
        if l_0_16 then
          l_0_8 = l_0_8 + 10
          l_0_9 = l_0_9 .. ";" .. l_0_14
        end
      end
    end
  end
  local l_0_18 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  local l_0_19 = {}
  if l_0_18 then
    local l_0_20 = mp.GetProcessCommandLine(l_0_18)
    if l_0_20 then
      local l_0_21 = mp.GetExecutablesFromCommandLine(l_0_20)
      l_0_21 = l_0_21 or {}
      local l_0_22 = mp.GetParentProcInfo(l_0_18)
      if l_0_22 and l_0_22.ppid then
        local l_0_23 = mp.GetProcessCommandLine(l_0_22.ppid)
        if l_0_23 then
          local l_0_24 = mp.GetExecutablesFromCommandLine(l_0_23)
          l_0_24 = l_0_24 or {}
          l_0_21 = table_dedup(table_merge(l_0_21, l_0_24))
        end
      end
    end
  end
  MpCommon.BmTriggerSig(l_0_18, "WDAVExclusion", l_0_10 or l_0_5)
  if 20 <= l_0_8 and mp.get_mpattribute("MpIsPowerShellAMSIScan") then
    set_research_data("BadExclusions", MpCommon.Base64Encode(l_0_9), false)
    set_research_data("ParentsInfo", MpCommon.Base64Encode(safeJsonSerialize(l_0_19)), false)
    local l_0_25, l_0_26 = hasSeenBefore("ALF:Trojan:Win32/WDAVExclusion.B", "", 1, "SignatureHitInMachine")
    if l_0_25 and 5 < l_0_26 then
      return mp.CLEAN
    end
    addDisruptionInfo(true)
    return mp.INFECTED
  end
end
return mp.CLEAN
