-- Threat: !InfrastructureShared
-- Name: GetEmailPaths
-- Type: 1

function getCachePaths(l_1_0)
  if l_1_0 == nil or l_1_0 == "" then
    return nil
  end
  local l_1_1 = {
    ["eudora.exe"] = {
      "%program_files%\\eudora\\attach\\",
      "%program_files%\\eudora data\\attach\\",
      "%program_files%\\qualcomm\\eudora\\attach\\",
      "appdata\\roaming\\qualcomm\\eudora\\attach\\",
      "appdata\\roaming\\qualcomm\\eudora\\attachments\\"
    },
    ["imapp.exe"] = {
      "message store\\attachments\\",
      "message store\\messages\\"
    },
    ["incmail.exe"] = {
      "microsoft\\windows\\inetcache\\ie\\",
      "message store\\attachments\\"
    },
    ["mailbird.exe"] = {
      "appdata\\local\\mailbird\\store\\a\\",
      "appdata\\local\\mailbird\\attachments\\"
    },
    ["msimn.exe"] = {
      "microsoft\\windows\\inetcache\\ie\\"
    },
    ["operamail.exe"] = {
      "appdata\\local\\opera mail\\mail\\cache\\",
      "appdata\\local\\opera mail\\opera mail\\cache\\",
      "appdata\\local\\opera mail\\opera mail\\store\\"
    },
    ["outlook.exe"] = {
      "%internet_cache%\\content.outlook\\",
      "microsoft\\windows\\temporary internet files\\content.outlook\\",
      "microsoft\\windows\\inetcache\\ie\\",
      "microsoft\\windows\\inetcache\\content.outlook\\"
    },
    ["waol.exe"] = {
      "microsoft\\windows\\temporary internet files\\content.ie5\\",
      "microsoft\\windows\\inetcache\\ie\\"
    },
    ["wlmail.exe"] = {
      "%internet_cache%\\content.ie5\\",
      "%internet_cache%\\ie\\",
      "microsoft\\windows\\temporary internet files\\content.ie5\\",
      "microsoft\\windows\\inetcache\\ie\\",
      "\\downloads"
    },
    ["hxmail.exe"] = {
      "appdata\\local\\packages\\microsoft.windowscommunicationsapps"
    },
    ["hxtsr.exe"] = {
      "appdata\\local\\packages\\microsoft.windowscommunicationsapps"
    },
    ["runtimebroker.exe"] = {
      "appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files\\s0\\"
    }
  }
  return l_1_1[l_1_0:lower()]
end

function isOutlookProcess(l_2_0)
  local l_2_1 = l_2_0 or mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_2_1 == nil then
    return
  end
  l_2_1 = string.lower(l_2_1)
  if l_2_1 == "outlook.exe" or l_2_1 == "olk.exe" then
    mp.set_mpattribute("BM_OutlookProcessOlk")
    return true
  elseif l_2_1 == "msedgewebview2.exe" then
    local l_2_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_2_2 == nil then
      return false
    end
    local l_2_3 = string.lower(mp.GetProcessCommandLine(l_2_2))
    if l_2_3 == nil or #l_2_3 <= 25 then
      return false
    end
    local l_2_4 = string.lower(string.gsub(l_2_3, " ", ""))
    if string.match(l_2_4, "%-%-webview%-exe%-name=olk%.exe") then
      mp.set_mpattribute("BM_OutlookProcessWebView")
      return true
    end
  end
  return false
end

function IsWebmailDownloadURL(l_3_0)
  if l_3_0 == nil then
    return false
  end
  if string.len(l_3_0) > 34 and l_3_0:find("_task=mail&_action=get&_mbox=inbox", 1, true) ~= nil then
    return true
  end
  local l_3_1 = l_3_0:match("https?://([%w%.-]+)")
  if l_3_1 == nil then
    return false
  end
  l_3_1 = l_3_1:lower()
  local l_3_2 = string.len(l_3_1)
  if 11 < l_3_2 and l_3_1:find("mail.google", 1, true) ~= nil or 16 < l_3_2 and l_3_1:find("mail-attachment", 1, true) ~= nil or 19 < l_3_2 and l_3_1:find("attachment.outlook.", 1, true) ~= nil or 13 < l_3_2 and l_3_1:find("dl-mail.ymail", 1, true) ~= nil or 18 < l_3_2 and l_3_1:find("attachments.office", 1, true) ~= nil or 11 < l_3_2 and l_3_1:find(".yahoomail.", 1, true) ~= nil or 16 < l_3_2 and l_3_1:find(".outlook.office.", 1, true) ~= nil or 23 < l_3_2 and l_3_1:find("docs.googleusercontent.", 1, true) ~= nil then
    return true
  end
  return false
end

function IsCommonFileSharingURL(l_4_0)
  if l_4_0 == nil then
    return false
  end
  local l_4_1 = l_4_0:match("https?://([%w%.-]+)")
  if l_4_1 == nil then
    return false
  end
  l_4_1 = l_4_1:lower()
  local l_4_2 = string.len(l_4_1)
  if 25 < l_4_2 and l_4_1:find("download.spaces.hightail.", 1, true) ~= nil or 20 < l_4_2 and l_4_1:find("download.wetransfer.", 1, true) ~= nil or 22 < l_4_2 and l_4_1:find("dl.dropboxusercontent.", 1, true) ~= nil or 14 < l_4_2 and l_4_1:find("onedrive.live.", 1, true) ~= nil then
    return true
  end
  return false
end
