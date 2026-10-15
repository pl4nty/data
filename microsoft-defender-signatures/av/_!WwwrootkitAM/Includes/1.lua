-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!WwwrootkitAM\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true
l_0_1["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true
l_0_1["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true
l_0_1["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.ExpandEnvironmentVariables)("%ExchangeInstallPath%")
if not isnull(l_0_2) and l_0_2 ~= "%ExchangeInstallPath%" and (sysio.IsFileExists)(l_0_2 .. "bin\\Microsoft.Exchange.Store.Service.exe") then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_FILENAME)
if not l_0_3 or isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = (string.match)(l_0_4, "(%.[^%.]+)$")
if isnull(l_0_5) then
  return mp.CLEAN
end
l_0_5 = (string.lower)(l_0_5)
local l_0_6 = {}
l_0_6[".asp"] = true
l_0_6[".aspx"] = true
l_0_6[".ashx"] = true
l_0_6[".asmx"] = true
l_0_6[".ascx"] = true
l_0_6[".asax"] = true
l_0_6[".cshtml"] = true
l_0_6[".vbhtml"] = true
if not l_0_6[l_0_5] then
  return mp.CLEAN
end
local l_0_7 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if isnull(l_0_7) then
  return mp.CLEAN
end
l_0_7 = (string.lower)(l_0_7)
local l_0_8 = false
local l_0_9 = (MpCommon.ExpandEnvironmentVariables)("%SystemDrive%\\inetpub\\wwwroot")
if not isnull(l_0_9) and (string.find)(l_0_7, (string.lower)(l_0_9), 1, true) then
  l_0_8 = true
end
if not l_0_8 then
  local l_0_10 = (MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config")
  if isnull(l_0_10) then
    return mp.CLEAN
  end
  local l_0_11 = (MpCommon.GetIisInstallPaths)(l_0_10)
  if isnull(l_0_11) then
    return mp.CLEAN
  end
  for l_0_15,l_0_16 in ipairs(l_0_11) do
    if not isnull(l_0_16.Path) and (string.find)(l_0_7, (string.lower)(l_0_16.Path), 1, true) then
      l_0_8 = true
      break
    end
  end
end
do
  if not l_0_8 then
    l_0_10 = mp
    l_0_10 = l_0_10.CLEAN
    return l_0_10
  end
  l_0_10 = mp
  l_0_10 = l_0_10.getfilesize
  l_0_10 = l_0_10()
  local l_0_17 = nil
  l_0_11 = isnull
  l_0_17 = l_0_10
  l_0_11 = l_0_11(l_0_17)
  if l_0_11 or l_0_10 < 20 then
    l_0_11 = mp
    l_0_11 = l_0_11.CLEAN
    return l_0_11
  end
  if l_0_10 > 524288 then
    l_0_11 = 524288
  end
  if not l_0_11 then
    l_0_11 = l_0_10
    local l_0_18, l_0_19, l_0_20 = nil
  end
  do
    l_0_17 = mp
    l_0_17 = l_0_17.readprotection
    l_0_17(false)
    l_0_17 = mp
    l_0_17 = l_0_17.readfile
    l_0_17 = l_0_17(0, l_0_11)
    local l_0_21 = nil
    l_0_21 = mp
    l_0_21 = l_0_21.readprotection
    l_0_21(true)
    l_0_21 = isnull
    l_0_21 = l_0_21(l_0_17)
    if l_0_21 then
      l_0_21 = mp
      l_0_21 = l_0_21.CLEAN
      return l_0_21
    end
    l_0_21 = string
    l_0_21 = l_0_21.lower
    l_0_21 = l_0_21(tostring(l_0_17))
    local l_0_22 = nil
    l_0_22 = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if (string.find)(l_1_0, l_1_6, 1, true) then
      return true
    end
  end
  return false
end

    local l_0_23 = nil
    l_0_23 = 0
    local l_0_24 = nil
    l_0_24 = false
    local l_0_25 = nil
    l_0_25 = false
    local l_0_26 = nil
    l_0_26 = false
    local l_0_27 = nil
    local l_0_28 = nil
    l_0_28 = "request.form"
    l_0_28 = l_0_22
    l_0_28 = l_0_28(l_0_21, l_0_27)
    if l_0_28 then
      l_0_24 = true
      l_0_23 = l_0_23 + 2
    end
    local l_0_29 = nil
    l_0_29 = "process.start"
    l_0_29 = l_0_22
    l_0_29 = l_0_29(l_0_21, l_0_28)
    if l_0_29 then
      l_0_25 = true
      l_0_23 = l_0_23 + 5
    end
    local l_0_30 = nil
    l_0_30 = "executeglobal"
    l_0_30 = l_0_22
    l_0_30 = l_0_30(l_0_21, l_0_29)
    if l_0_30 then
      l_0_26 = true
      l_0_23 = l_0_23 + 5
    end
    local l_0_31 = nil
    l_0_31 = "eval(request"
    l_0_31 = l_0_22
    l_0_31 = l_0_31(l_0_21, l_0_30)
    local l_0_32 = nil
    local l_0_33 = nil
    l_0_33 = "activator.createinstance"
    l_0_33 = l_0_22
    l_0_33 = l_0_33(l_0_21, l_0_32)
    if l_0_33 then
      l_0_23 = l_0_23 + 2
    end
    l_0_33 = string
    l_0_33 = l_0_33.find
    l_0_33 = l_0_33(l_0_21, "eval(", 1, true)
    if not l_0_33 then
      l_0_33 = string
      l_0_33 = l_0_33.find
      l_0_33 = l_0_33(l_0_21, "new function(", 1, true)
    end
    if l_0_33 then
      l_0_23 = l_0_23 + 1
    end
    local l_0_34 = nil
    l_0_34 = "frombase64string"
    l_0_34 = l_0_22
    l_0_34 = l_0_34(l_0_21, l_0_33)
    if l_0_34 then
      l_0_23 = l_0_23 + 2
    end
    local l_0_35 = nil
    l_0_35 = "webclient"
    l_0_35 = l_0_22
    l_0_35 = l_0_35(l_0_21, l_0_34)
    if l_0_35 then
      l_0_23 = l_0_23 + 2
    end
    local l_0_36 = nil
    l_0_36 = "scripting.filesystemobject"
    l_0_36 = l_0_22
    l_0_36 = l_0_36(l_0_21, l_0_35)
    if l_0_36 then
      l_0_23 = l_0_23 + 2
    end
    local l_0_37 = nil
    l_0_37 = "response.write"
    l_0_37 = l_0_22
    l_0_37 = l_0_37(l_0_21, l_0_36)
    if l_0_37 then
      l_0_23 = l_0_23 + 1
    end
    local l_0_38 = nil
    l_0_38 = "china chopper"
    l_0_38 = l_0_22
    l_0_38 = l_0_38(l_0_21, l_0_37)
    local l_0_39 = nil
    local l_0_40 = nil
    l_0_40 = "redirectstandardoutput"
    l_0_40 = l_0_22
    l_0_40 = l_0_40(l_0_21, l_0_39)
    local l_0_41 = nil
    if l_0_38 then
      l_0_41 = set_research_data
      l_0_41("webshell_path", l_0_7, false)
      l_0_41 = set_research_data
      l_0_41("webshell_reason", "family_fingerprint", false)
      l_0_41 = set_research_data
      l_0_41("webshell_score", tostring(l_0_23), false)
      l_0_41 = mp
      l_0_41 = l_0_41.INFECTED
      return l_0_41
    end
    if l_0_31 then
      l_0_41 = set_research_data
      l_0_41("webshell_path", l_0_7, false)
      l_0_41 = set_research_data
      l_0_41("webshell_reason", "eval_of_request", false)
      l_0_41 = set_research_data
      l_0_41("webshell_score", tostring(l_0_23), false)
      l_0_41 = mp
      l_0_41 = l_0_41.INFECTED
      return l_0_41
    end
    if l_0_24 and l_0_26 then
      l_0_41 = set_research_data
      l_0_41("webshell_path", l_0_7, false)
      l_0_41 = set_research_data
      l_0_41("webshell_reason", "input_to_dyncode", false)
      l_0_41 = set_research_data
      l_0_41("webshell_score", tostring(l_0_23), false)
      l_0_41 = mp
      l_0_41 = l_0_41.INFECTED
      return l_0_41
    end
    if l_0_24 and l_0_25 and l_0_40 then
      l_0_41 = set_research_data
      l_0_41("webshell_path", l_0_7, false)
      l_0_41 = set_research_data
      l_0_41("webshell_reason", "command_shell_with_output", false)
      l_0_41 = set_research_data
      l_0_41("webshell_score", tostring(l_0_23), false)
      l_0_41 = mp
      l_0_41 = l_0_41.INFECTED
      return l_0_41
    end
    if l_0_24 and l_0_25 and l_0_23 >= 9 then
      l_0_41 = set_research_data
      l_0_41("webshell_path", l_0_7, false)
      l_0_41 = set_research_data
      l_0_41("webshell_reason", "input_to_cmdexec", false)
      l_0_41 = set_research_data
      l_0_41("webshell_score", tostring(l_0_23), false)
      l_0_41 = mp
      l_0_41 = l_0_41.INFECTED
      return l_0_41
    end
    l_0_41 = mp
    l_0_41 = l_0_41.CLEAN
    return l_0_41
  end
end

