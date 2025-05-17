-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BLKACC3b576869-a4ec-4529-8536-b80a7769e899\5.luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if GetCtxOfficeProc() ~= "productivity" then
  if (MpCommon.GetPersistContextCountNoPath)("BlockOfficeCreateExecContentProcs") == 0 then
    return mp.CLEAN
  end
  local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_0 == "" or l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1 .. "+" .. l_0_0
  if not (MpCommon.QueryPersistContextNoPath)("BlockOfficeCreateExecContentProcs", l_0_2) then
    return mp.CLEAN
  end
end
do
  if not peattributes.isexe and not peattributes.isdll and not peattributes.isdriver then
    return mp.CLEAN
  end
  local l_0_3, l_0_4 = (mp.IsTrustedFile)(false)
  if l_0_3 == true then
    return mp.CLEAN
  end
  local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = (string.lower)(l_0_5)
  local l_0_6 = (MpCommon.PathToWin32Path)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = (string.lower)(l_0_6)
  local l_0_7 = l_0_6 .. "\\" .. l_0_5
  local l_0_8 = ((string.lower)((mp.ContextualExpandEnvironmentVariables)("%userprofile%")))
  local l_0_9 = nil
  if l_0_8 ~= nil and l_0_8 ~= "" then
    l_0_9 = (string.match)(l_0_8, "(%a:.*\\)[^\\]+$")
  end
  local l_0_10 = (MpCommon.ExpandEnvironmentVariables)("%programfiles%")
  l_0_10 = (l_0_10 == nil and "" or l_0_10):lower()
  local l_0_11 = (MpCommon.ExpandEnvironmentVariables)("%programfiles(x86)%")
  l_0_11 = (l_0_11 == nil and "" or l_0_11):lower()
  local l_0_12 = (MpCommon.ExpandEnvironmentVariables)("%commonprogramfiles%")
  l_0_12 = (l_0_12 == nil and "" or l_0_12):lower()
  local l_0_13 = (MpCommon.ExpandEnvironmentVariables)("%commonprogramfiles(x86)%")
  l_0_13 = (l_0_13 == nil and "" or l_0_13):lower()
  local l_0_14 = (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")
  l_0_14 = (l_0_14 == nil and "" or l_0_14):lower()
  local l_0_15 = (MpCommon.ExpandEnvironmentVariables)("%systemroot%")
  l_0_15 = (l_0_15 == nil and "" or l_0_15):lower()
  if l_0_9 ~= nil and l_0_9 ~= "" then
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\low\\sogoupy") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\roaming\\locallow\\sogoupy") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\roaming\\onetastic") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp\\onenotesyncdata") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp\\onenotesyncdata\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\assembly\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_7:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\onenote%d*\\%d+%.%d+\\cache\\.+%.%a*bin$") ~= nil then
      return mp.CLEAN
    end
    if l_0_7:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\onenote%d*\\%d+%.%d+\\cache\\tmp\\.+%.%a*bin$") ~= nil then
      return mp.CLEAN
    end
    if l_0_7:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\msoidentitycrl\\production\\[^\\]+%.dll$") ~= nil then
      return mp.CLEAN
    end
    if l_0_7:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\uev\\.+%.pkgdat$") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\appv\\client\\vfs\\[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_7:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\onedrive\\%d+%.%d+%.%d+%.%d+\\.+%.dll.*$") ~= nil then
      return mp.CLEAN
    end
    if l_0_7:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\.+%.dll$") ~= nil then
      return mp.CLEAN
    end
    if l_0_7:find(l_0_9 .. "[^\\]+\\appdata\\local\\microsoft\\teams\\current\\.+%.dll$") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp\\deployment\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp\\onenotesyncdata\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\mssolvehelper databroker\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp\\deployment\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp\\onenotesyncdata\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp\\officemix.setup.") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local") ~= nil and l_0_6:find("\\apps\\%d%.%d\\%w%w%w%w%w%w%w%w%.%w%w%w\\%w%w%w%w%w%w%w%w%.%w%w%w\\") ~= nil then
      return mp.CLEAN
    end
    if l_0_6:find(l_0_9 .. "[^\\]+\\appdata\\local\\temp") ~= nil and l_0_5:match("^{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}$") then
      return mp.CLEAN
    end
  end
  if l_0_6:find(l_0_10 .. "\\microsoft office\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_6:find(l_0_12 .. "\\microsoft shared\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_6 == l_0_10 .. "\\microsoft azure information protection\\" then
    return mp.CLEAN
  end
  if l_0_6:find(l_0_11 .. "\\microsoft office\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_6:find(l_0_13 .. "\\microsoft shared\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if l_0_6 == l_0_11 .. "\\microsoft azure information protection\\" then
    return mp.CLEAN
  end
  if l_0_6 == l_0_14 .. "\\gendox\\teams\\common\\bin" then
    return mp.CLEAN
  end
  if l_0_6:find(l_0_15 .. "\\assembly\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if (mp.get_mpattribute)("Lua:SignedThinkCellComponent") then
    return mp.CLEAN
  end
  if (mp.IsPathExcludedForHipsRule)(l_0_7, "3b576869-a4ec-4529-8536-b80a7769e899") then
    return mp.CLEAN
  end
  if peattributes.isdll and (mp.get_mpattribute)("SOAPSchema.A") then
    return mp.CLEAN
  end
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end

