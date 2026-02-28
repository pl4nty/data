local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = L0_1
L0_1 = L0_1.lower
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = "(tomcat|nginx|httpd|w3wp|sqlservr|oracle|msmdsrv|msdtssrvr|mysql)"
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.match
  L4_2 = "([^\\]+)$"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = false
  L4_2 = MpCommon
  L4_2 = L4_2.StringRegExpSearch
  L5_2 = L1_2
  L6_2 = L2_2
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  _ = L5_2
  L3_2 = L4_2
  if L3_2 then
    return L2_2
  else
    L4_2 = nil
    return L4_2
  end
end

L2_1 = L1_1
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = bm
  L3_1 = L3_1.get_process_relationships
  L3_1, L4_1 = L3_1()
  L5_1 = ipairs
  L6_1 = L3_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L0_1 = L9_1.image_path
    if L0_1 then
      L10_1 = L1_1
      L11_1 = L0_1
      L10_1 = L10_1(L11_1)
      L2_1 = L10_1
      if L2_1 then
        L10_1 = bm
        L10_1 = L10_1.add_related_string
        L11_1 = "ServerPath_GParent"
        L12_1 = L0_1
        L13_1 = bm
        L13_1 = L13_1.RelatedStringBMReport
        L10_1(L11_1, L12_1, L13_1)
        break
      end
    end
  end
else
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "ServerPath_Parent"
  L5_1 = L0_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = nil
L5_1 = "\\.(php|aar|armx|asax|asbx|ascx|ashx|asmx|asp|aspq|aspx|axd|cfm|cgi|cshtm|cshtml|jsp|jspx|phar|phtml|shtml|swf|vbhtm|vbhtml|php2|php3|php4|php5)$"
L6_1 = mp
L6_1 = L6_1.SIGATTR_LOG_SZ
L7_1 = 1
L8_1 = -1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = sigattr_tail
  L10_1 = L10_1[L9_1]
  L11_1 = L10_1.matched
  if L11_1 then
    L11_1 = L10_1.attribute
    if L11_1 == 16384 then
      L11_1 = L10_1.utf8p1
      if L11_1 then
        L11_1 = string
        L11_1 = L11_1.lower
        L12_1 = L10_1.utf8p1
        L11_1 = L11_1(L12_1)
        L12_1 = L11_1
        L11_1 = L11_1.match
        L13_1 = "([^\\]+)$"
        L11_1 = L11_1(L12_1, L13_1)
        L12_1 = MpCommon
        L12_1 = L12_1.StringRegExpSearch
        L13_1 = L5_1
        L14_1 = L11_1
        L12_1, L13_1 = L12_1(L13_1, L14_1)
        if L12_1 then
          L3_1 = L11_1
          L4_1 = L10_1.utf8p1
          L14_1 = bm
          L14_1 = L14_1.add_related_file
          L15_1 = L10_1.utf8p1
          L14_1(L15_1)
          break
        end
      end
    end
  end
end
if not L3_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.gsub
L7_1 = L3_1
L8_1 = "%d"
L9_1 = "0"
L6_1 = L6_1(L7_1, L8_1, L9_1)
L7_1 = #L6_1
if 20 < L7_1 then
  L7_1 = string
  L7_1 = L7_1.sub
  L8_1 = L6_1
  L9_1 = 1
  L10_1 = 20
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  L8_1 = ":"
  L9_1 = #L6_1
  L7_1 = L7_1 .. L8_1 .. L9_1
  L6_1 = L7_1 or L6_1
  if not L7_1 then
  end
end
L7_1 = string
L7_1 = L7_1.match
L8_1 = L4_1
L9_1 = "(.*\\)"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == nil or not L7_1 then
  L7_1 = ""
end
L8_1 = NormalizeDirectory
L9_1 = L7_1
L8_1 = L8_1(L9_1)
L7_1 = L8_1
L8_1 = MpCommon
L8_1 = L8_1.IsSampled
L9_1 = 100000
L10_1 = true
L11_1 = true
L12_1 = true
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
if L8_1 then
  L8_1 = "ShellCodeFileName"
  L9_1 = L2_1
  L10_1 = "_"
  L11_1 = L7_1
  L12_1 = L6_1
  L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1
  L10_1 = AnomalyTableCheck
  L11_1 = L8_1
  L12_1 = L9_1
  L13_1 = 30
  L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1, L13_1)
  if L10_1 and not L11_1 then
    L13_1 = {}
    L13_1.FileName = L3_1
    L13_1.FilePath = L7_1
    L13_1.ShellCodeName_Normalzied = L6_1
    L13_1.WebSrv = L2_1
    L13_1.AnomalyTableName = "ShellCodeFileName"
    L13_1.AnomalyTableInfo = L12_1
    L14_1 = bm
    L14_1 = L14_1.add_related_string
    L15_1 = "AnomalyData"
    L16_1 = safeJsonSerialize
    L17_1 = L13_1
    L16_1 = L16_1(L17_1)
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = reportSessionInformation
    L14_1()
    L14_1 = add_parents
    L14_1()
    L14_1 = bm
    L14_1 = L14_1.get_current_process_startup_info
    L14_1 = L14_1()
    if L14_1 then
      L15_1 = "AnomalousFileNameDrop["
      L16_1 = L14_1.ppid
      L17_1 = L16_1
      L16_1 = L16_1.match
      L18_1 = "pid:(%d+)"
      L16_1 = L16_1(L17_1, L18_1)
      L17_1 = "]"
      L15_1 = L15_1 .. L16_1 .. L17_1
      L16_1 = {}
      L16_1.ShellCodeName = L3_1
      L16_1.Key = L9_1
      L17_1 = IncreaseProcessAnomalyScore
      L18_1 = L14_1.ppid
      L19_1 = 5
      L20_1 = L15_1
      L21_1 = "PFApp_Parent"
      L22_1 = L16_1
      L17_1(L18_1, L19_1, L20_1, L21_1, L22_1)
    end
    L15_1 = mp
    L15_1 = L15_1.INFECTED
    return L15_1
  end
else
  L8_1 = "ShellCodeFileName"
  L9_1 = MpCommon
  L9_1 = L9_1.AnomalyEventLookup
  L10_1 = L8_1
  L11_1 = "MarkerRecord_table_creationtime"
  L12_1 = 1
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  L10_1 = 0
  L11_1 = MpCommon
  L11_1 = L11_1.GetCurrentTimeT
  L11_1 = L11_1()
  L12_1 = L11_1
  if L9_1 then
    L13_1 = L9_1.Count
    if L13_1 then
      L12_1 = L9_1.Count
    end
    L10_1 = L9_1.LastSeen
  else
    L12_1 = L11_1
    L13_1 = MpCommon
    L13_1 = L13_1.AnomalyEventUpdate
    L14_1 = L8_1
    L15_1 = "MarkerRecord_table_creationtime"
    L16_1 = L11_1
    L17_1 = 1
    L13_1(L14_1, L15_1, L16_1, L17_1)
  end
  L13_1 = L11_1 - L12_1
  L13_1 = L13_1 / 60
  L14_1 = L2_1
  L15_1 = "_"
  L16_1 = L7_1
  L17_1 = L6_1
  L14_1 = L14_1 .. L15_1 .. L16_1 .. L17_1
  L15_1 = MpCommon
  L15_1 = L15_1.AnomalyEventLookup
  L16_1 = L8_1
  L17_1 = L14_1
  L18_1 = 1
  L15_1 = L15_1(L16_1, L17_1, L18_1)
  if not L15_1 then
    if 43200 < L13_1 then
      L16_1 = {}
      L16_1.FileName = L3_1
      L16_1.FilePath = L7_1
      L16_1.ShellCodeName_Normalzied = L6_1
      L16_1.WebSrv = L2_1
      L16_1.TableLastSeen = L10_1
      L16_1.TableUnbiasedTime = L13_1
      L16_1.isTest = false
      L17_1 = bm
      L17_1 = L17_1.add_related_string
      L18_1 = "AnomalyData"
      L19_1 = safeJsonSerialize
      L20_1 = L16_1
      L19_1 = L19_1(L20_1)
      L20_1 = bm
      L20_1 = L20_1.RelatedStringBMReport
      L17_1(L18_1, L19_1, L20_1)
      L17_1 = reportSessionInformation
      L17_1()
      L17_1 = add_parents
      L17_1()
      L17_1 = bm
      L17_1 = L17_1.get_current_process_startup_info
      L17_1 = L17_1()
      if L17_1 then
        L18_1 = "AnomalousFileNameDrop["
        L19_1 = L17_1.ppid
        L20_1 = L19_1
        L19_1 = L19_1.match
        L21_1 = "pid:(%d+)"
        L19_1 = L19_1(L20_1, L21_1)
        L20_1 = "]"
        L18_1 = L18_1 .. L19_1 .. L20_1
        L19_1 = {}
        L19_1.ShellCodeName = L3_1
        L19_1.Key = L14_1
        L20_1 = IncreaseProcessAnomalyScore
        L21_1 = L17_1.ppid
        L22_1 = 5
        L23_1 = L18_1
        L24_1 = "PFApp_Parent"
        L25_1 = L19_1
        L20_1(L21_1, L22_1, L23_1, L24_1, L25_1)
      end
      L18_1 = mp
      L18_1 = L18_1.INFECTED
      return L18_1
    else
      L16_1 = MpCommon
      L16_1 = L16_1.AnomalyEventUpdate
      L17_1 = L8_1
      L18_1 = L14_1
      L19_1 = 1
      L20_1 = 1
      L16_1(L17_1, L18_1, L19_1, L20_1)
    end
  else
    L16_1 = L15_1.Count
    L16_1 = L16_1 + 1
    L17_1 = MpCommon
    L17_1 = L17_1.AnomalyEventUpdate
    L18_1 = L8_1
    L19_1 = L14_1
    L20_1 = L16_1
    L21_1 = 1
    L17_1(L18_1, L19_1, L20_1, L21_1)
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
