-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\151b33929e929\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((bm.get_imagepath)()):lower()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = "(tomcat|nginx|httpd|w3wp|sqlservr|oracle|msmdsrv|msdtssrvr|mysql)"
  local l_1_2 = ((string.lower)(l_1_0)):match("([^\\]+)$")
  local l_1_3 = false
  l_1_3 = (MpCommon.StringRegExpSearch)(l_1_1, l_1_2)
  if l_1_3 then
    return l_1_2
  else
    return nil
  end
end

local l_0_2 = l_0_1(l_0_0)
if not l_0_2 then
  local l_0_3, l_0_4 = (bm.get_process_relationships)()
  for l_0_8,l_0_9 in ipairs(l_0_3) do
    l_0_0 = l_0_9.image_path
    if l_0_0 then
      l_0_2 = l_0_1(l_0_0)
      if l_0_2 then
        (bm.add_related_string)("ServerPath_GParent", l_0_0, bm.RelatedStringBMReport)
        break
      end
    end
  end
else
  do
    ;
    (bm.add_related_string)("ServerPath_Parent", l_0_0, bm.RelatedStringBMReport)
    if not l_0_2 then
      return mp.CLEAN
    end
    local l_0_10, l_0_11 = nil, nil
    local l_0_12 = "\\.(php|aar|armx|asax|asbx|ascx|ashx|asmx|asp|aspq|aspx|axd|cfm|cgi|cshtm|cshtml|jsp|jspx|phar|phtml|shtml|swf|vbhtm|vbhtml|php2|php3|php4|php5)$"
    for l_0_16 = mp.SIGATTR_LOG_SZ, 1, -1 do
      local l_0_17 = sigattr_tail[l_0_16]
      if l_0_17.matched and l_0_17.attribute == 16384 and l_0_17.utf8p1 then
        local l_0_18 = ((string.lower)(l_0_17.utf8p1)):match("([^\\]+)$")
        local l_0_19, l_0_20 = (MpCommon.StringRegExpSearch)(l_0_12, l_0_18)
        if l_0_19 then
          do
            do
              l_0_10 = l_0_18
              l_0_11 = l_0_17.utf8p1
              ;
              (bm.add_related_file)(l_0_17.utf8p1)
              do break end
              -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    if not l_0_10 then
      return mp.CLEAN
    end
    local l_0_21 = (string.gsub)(l_0_10, "%d", "0")
    if #l_0_21 <= 20 or not (string.sub)(l_0_21, 1, 20) .. ":" .. #l_0_21 then
      local l_0_22 = (string.match)(l_0_11, "(.*\\)")
      if l_0_22 == nil or not l_0_22 then
        l_0_22 = ""
      end
      l_0_22 = NormalizeDirectory(l_0_22)
      if (MpCommon.IsSampled)(100000, true, true, true) then
        local l_0_23 = "ShellCodeFileName"
        local l_0_24 = l_0_2 .. "_" .. l_0_22 .. l_0_21
        local l_0_25, l_0_26, l_0_27 = AnomalyTableCheck(l_0_23, l_0_24, 30)
        if l_0_25 and not l_0_26 then
          local l_0_28 = {}
          l_0_28.FileName = l_0_10
          l_0_28.FilePath = l_0_22
          l_0_28.ShellCodeName_Normalzied = l_0_21
          l_0_28.WebSrv = l_0_2
          l_0_28.AnomalyTableName = "ShellCodeFileName"
          l_0_28.AnomalyTableInfo = l_0_27
          ;
          (bm.add_related_string)("AnomalyData", safeJsonSerialize(l_0_28), bm.RelatedStringBMReport)
          reportSessionInformation()
          add_parents()
          local l_0_29 = (bm.get_current_process_startup_info)()
          if l_0_29 then
            local l_0_30 = "AnomalousFileNameDrop[" .. (l_0_29.ppid):match("pid:(%d+)") .. "]"
            local l_0_31 = {}
            l_0_31.ShellCodeName = l_0_10
            l_0_31.Key = l_0_24
            IncreaseProcessAnomalyScore(l_0_29.ppid, 5, l_0_30, "PFApp_Parent", l_0_31)
          end
          do
            do
              do return mp.INFECTED end
              local l_0_32 = "ShellCodeFileName"
              local l_0_33 = (MpCommon.AnomalyEventLookup)(l_0_32, "MarkerRecord_table_creationtime", 1)
              local l_0_34 = 0
              local l_0_35 = (MpCommon.GetCurrentTimeT)()
              local l_0_36 = l_0_35
              if l_0_33 then
                if l_0_33.Count then
                  l_0_36 = l_0_33.Count
                end
                l_0_34 = l_0_33.LastSeen
              else
                l_0_36 = l_0_35
                ;
                (MpCommon.AnomalyEventUpdate)(l_0_32, "MarkerRecord_table_creationtime", l_0_35, 1)
              end
              local l_0_37 = (l_0_35 - l_0_36) / 60
              local l_0_38 = l_0_2 .. "_" .. l_0_22 .. l_0_21
              local l_0_39 = (MpCommon.AnomalyEventLookup)(l_0_32, l_0_38, 1)
              if not l_0_39 then
                if l_0_37 > 43200 then
                  local l_0_40 = {}
                  l_0_40.FileName = l_0_10
                  l_0_40.FilePath = l_0_22
                  l_0_40.ShellCodeName_Normalzied = l_0_21
                  l_0_40.WebSrv = l_0_2
                  l_0_40.TableLastSeen = l_0_34
                  l_0_40.TableUnbiasedTime = l_0_37
                  l_0_40.isTest = false
                  ;
                  (bm.add_related_string)("AnomalyData", safeJsonSerialize(l_0_40), bm.RelatedStringBMReport)
                  reportSessionInformation()
                  add_parents()
                  local l_0_41 = (bm.get_current_process_startup_info)()
                  if l_0_41 then
                    local l_0_42 = "AnomalousFileNameDrop[" .. (l_0_41.ppid):match("pid:(%d+)") .. "]"
                    local l_0_43 = {}
                    l_0_43.ShellCodeName = l_0_10
                    l_0_43.Key = l_0_38
                    IncreaseProcessAnomalyScore(l_0_41.ppid, 5, l_0_42, "PFApp_Parent", l_0_43)
                  end
                  do
                    do
                      do return mp.INFECTED end
                      ;
                      (MpCommon.AnomalyEventUpdate)(l_0_32, l_0_38, 1, 1)
                      do
                        local l_0_44 = l_0_39.Count + 1
                        ;
                        (MpCommon.AnomalyEventUpdate)(l_0_32, l_0_38, l_0_44, 1)
                        return mp.CLEAN
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

