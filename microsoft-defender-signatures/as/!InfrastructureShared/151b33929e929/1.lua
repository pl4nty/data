-- Threat: !InfrastructureShared
-- Name: 151b33929e929
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib, AppomalyHelpers

local l_0_0 = bm.get_imagepath():lower()
if not l_0_0 then
  return mp.CLEAN
end

local function l_0_1(l_1_0)
  local l_1_1 = "(tomcat|nginx|httpd|w3wp|sqlservr|oracle|msmdsrv|msdtssrvr|mysql)"
  local l_1_2 = string.lower(l_1_0):match("([^\\]+)$")
  local l_1_3 = false
  l_1_3, _ = MpCommon.StringRegExpSearch(l_1_1, l_1_2)
  if l_1_3 then
    return l_1_2
  else
    return nil
  end
end

local l_0_2 = l_0_1(l_0_0)
if not l_0_2 then
  local l_0_3, l_0_4 = bm.get_process_relationships()
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    l_0_0 = l_0_6.image_path
    if l_0_0 then
      l_0_2 = l_0_1(l_0_0)
      if l_0_2 then
        bm.add_related_string("ServerPath_GParent", l_0_0, bm.RelatedStringBMReport)
        break
      end
    end
  end
else
  bm.add_related_string("ServerPath_Parent", l_0_0, bm.RelatedStringBMReport)
end
if not l_0_2 then
  return mp.CLEAN
end
local l_0_7, l_0_8
local l_0_9 = "\\.(php|aar|armx|asax|asbx|ascx|ashx|asmx|asp|aspq|aspx|axd|cfm|cgi|cshtm|cshtml|jsp|jspx|phar|phtml|shtml|swf|vbhtm|vbhtml|php2|php3|php4|php5)$"
for l_0_10 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_11 = sigattr_tail[l_0_10]
  if l_0_11.matched and l_0_11.attribute == 16384 and l_0_11.utf8p1 then
    local l_0_12 = string.lower(l_0_11.utf8p1):match("([^\\]+)$")
    local l_0_13, l_0_14 = MpCommon.StringRegExpSearch(l_0_9, l_0_12)
    if l_0_13 then
      l_0_7 = l_0_12
      l_0_8 = l_0_11.utf8p1
      bm.add_related_file(l_0_11.utf8p1)
      break
    end
  end
end
if not l_0_7 then
  return mp.CLEAN
end
local l_0_15 = string.gsub(l_0_7, "%d", "0")
l_0_15 = 20 < #l_0_15 and string.sub(l_0_15, 1, 20) .. ":" .. #l_0_15 or l_0_15
local l_0_16 = string.match(l_0_8, "(.*\\)")
l_0_16 = l_0_16 ~= nil and l_0_16 or ""
l_0_16 = NormalizeDirectory(l_0_16)
if versioning.IsSampled(100000, true, true, true) then
  local l_0_17 = "ShellCodeFileName_0"
  local l_0_18 = l_0_2 .. "_" .. l_0_16 .. l_0_15
  local l_0_19, l_0_20, l_0_21 = AnomalyTableCheck(l_0_17, l_0_18, 30)
  if l_0_19 and not l_0_20 then
    local l_0_22 = {}
    l_0_22.FileName = l_0_7
    l_0_22.FilePath = l_0_16
    l_0_22.ShellCodeName_Normalzied = l_0_15
    l_0_22.WebSrv = l_0_2
    l_0_22.AnomalyTableName = "ShellCodeFileName"
    l_0_22.AnomalyTableInfo = l_0_21
    bm.add_related_string("AnomalyData", safeJsonSerialize(l_0_22), bm.RelatedStringBMReport)
    reportSessionInformation()
    add_parents()
    local l_0_23 = bm.get_current_process_startup_info()
    if l_0_23 then
      local l_0_24 = "AnomalousFileNameDrop[" .. l_0_23.ppid:match("pid:(%d+)") .. "]"
      local l_0_25 = {}
      l_0_25.ShellCodeName = l_0_7
      l_0_25.Key = l_0_18
      IncreaseProcessAnomalyScore(l_0_23.ppid, 5, l_0_24, "PFApp_Parent", l_0_25)
    end
    return mp.INFECTED
  end
else
  local l_0_26 = "ShellCodeFileName_0"
  local l_0_27 = MpCommon.AnomalyEventLookup(l_0_26, "MarkerRecord_table_creationtime", 1)
  local l_0_28 = 0
  local l_0_29 = MpCommon.GetCurrentTimeT()
  local l_0_30 = l_0_29
  if l_0_27 then
    if l_0_27.Count then
      l_0_30 = l_0_27.Count
    end
    l_0_28 = l_0_27.LastSeen
  else
    l_0_30 = l_0_29
    MpCommon.AnomalyEventUpdate(l_0_26, "MarkerRecord_table_creationtime", l_0_29, 1)
  end
  local l_0_31 = (l_0_29 - l_0_30) / 60
  local l_0_32 = l_0_2 .. "_" .. l_0_16 .. l_0_15
  local l_0_33 = MpCommon.AnomalyEventLookup(l_0_26, l_0_32, 1)
  if not l_0_33 then
    if 43200 < l_0_31 then
      local l_0_34 = {}
      l_0_34.FileName = l_0_7
      l_0_34.FilePath = l_0_16
      l_0_34.ShellCodeName_Normalzied = l_0_15
      l_0_34.WebSrv = l_0_2
      l_0_34.TableLastSeen = l_0_28
      l_0_34.TableUnbiasedTime = l_0_31
      l_0_34.isTest = false
      bm.add_related_string("AnomalyData", safeJsonSerialize(l_0_34), bm.RelatedStringBMReport)
      reportSessionInformation()
      add_parents()
      local l_0_35 = bm.get_current_process_startup_info()
      if l_0_35 then
        local l_0_36 = "AnomalousFileNameDrop[" .. l_0_35.ppid:match("pid:(%d+)") .. "]"
        local l_0_37 = {}
        l_0_37.ShellCodeName = l_0_7
        l_0_37.Key = l_0_32
        IncreaseProcessAnomalyScore(l_0_35.ppid, 5, l_0_36, "PFApp_Parent", l_0_37)
      end
      return mp.INFECTED
    else
      MpCommon.AnomalyEventUpdate(l_0_26, l_0_32, 1, 1)
    end
  else
    local l_0_38 = l_0_33.Count + 1
    MpCommon.AnomalyEventUpdate(l_0_26, l_0_32, l_0_38, 1)
  end
end
return mp.CLEAN
