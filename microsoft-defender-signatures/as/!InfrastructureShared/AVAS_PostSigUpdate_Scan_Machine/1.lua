-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\AVAS_PostSigUpdate_Scan_Machine\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1, l_0_2 = pcall(Infrastructure_NeobarReportPathExclusions, "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.NeobarReportPathExclusions_Policies = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
l_0_1 = pcall(Infrastructure_NeobarReportPathExclusions, "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.NeobarReportPathExclusions = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC37: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_SoctuseerReportPathExclusions, "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.SoctuseerReportPathExclusions_Policies = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC54: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_SoctuseerReportPathExclusions, "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.SoctuseerReportPathExclusions = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC70: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanWDFirewallBlockRules)
if not l_0_1 then
  l_0_0.ScanWDFirewallBlockRules = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC86: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_AntiTamperingCheckAndRepair)
if not l_0_1 then
  l_0_0.AntiTamperingCheckAndRepair = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC102: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanEFISystemPartitions)
if not l_0_1 then
  l_0_0.ScanEFISystemPartitions = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC118: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_FirstTimeAT)
if not l_0_1 then
  l_0_0.FirstTimeAT = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC134: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanLeviathon)
if not l_0_1 then
  l_0_0.ScanLeviathon = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC150: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanCFABootProtState)
if not l_0_1 then
  l_0_0.ScanCFABootProtState = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC166: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanMpEtwPublisher)
if not l_0_1 then
  l_0_0.ScanMpEtwPublisher = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC182: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_DLAMTelemetry)
if not l_0_1 then
  l_0_0.DLAMTelemetry = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC198: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ExclusionTelemetry)
if not l_0_1 then
  l_0_0.ExclusionTelemetry = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC215: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_AsrLinkScan, "postsig")
if not l_0_1 then
  l_0_0.AsrLinkScan = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC231: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_AnomalyTableTelemetry)
if not l_0_1 then
  l_0_0.AnomalyTableTelemetry = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC256: Overwrote pending register: R2 in 'AssignReg'

if (MpCommon.IsSampled)(100, true, true, true) then
  l_0_1 = pcall(Infrastructure_ReportUEFIData)
  if not l_0_1 then
    l_0_0.ReportUEFIData = l_0_2
    if l_0_2 == "Scanning aborted by the user!" then
      error((MpCommon.JsonSerialize)(l_0_0))
    end
  end
end
-- DECOMPILER ERROR at PC272: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_SharePointScan)
if not l_0_1 then
  l_0_0.SharePointScan = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
local l_0_3 = (versioning.GetEngineRing)()
-- DECOMPILER ERROR at PC295: Overwrote pending register: R2 in 'AssignReg'

if l_0_3 <= versioning.ENGINE_RING_1_PRERELEASE then
  l_0_1 = pcall(function()
  -- function num : 0_0
  local l_1_0 = function(l_2_0)
    -- function num : 0_0_0
    local l_2_1 = {}
    local l_2_2 = string.gmatch
    l_2_2 = l_2_2(l_2_0 or "", "[^.]+")
    for i_1 in l_2_2 do
      l_2_1[#l_2_1 + 1] = i_1
    end
    do return l_2_1 end
    -- DECOMPILER ERROR at PC15: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end

  local l_1_6 = function(l_3_0, l_3_1)
    -- function num : 0_0_1 , upvalues : l_1_0
    local l_3_2 = l_1_0(l_3_0)
    local l_3_3 = (l_1_0(l_3_1))
    local l_3_4 = nil
    if #l_3_2 < #l_3_3 then
      l_3_4 = #l_3_3
    else
      l_3_4 = #l_3_2
    end
    for l_3_8 = 1, l_3_4 do
      do
        local l_3_9, l_3_10, l_3_12 = l_3_2[l_3_8] or "0"
        do
          local l_3_11, l_3_13 = , l_3_3[l_3_8] or "0"
          -- DECOMPILER ERROR at PC27: Confused about usage of register: R9 in 'UnsetPending'

          local l_3_14 = nil
          -- DECOMPILER ERROR at PC30: Confused about usage of register: R10 in 'UnsetPending'

          local l_3_15 = nil
          -- DECOMPILER ERROR at PC43: Unhandled construct in 'MakeBoolean' P1

          if tonumber(l_3_11) >= tonumber(l_3_13) or not -1 then
            do return not tonumber(l_3_11) or not tonumber(l_3_13) or tonumber(l_3_11) == tonumber(l_3_13) or 1 end
            if l_3_14 >= l_3_15 or not -1 then
              do
                do return l_3_14 == l_3_15 or 1 end
                -- DECOMPILER ERROR at PC55: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC55: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC55: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC55: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC55: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC55: LeaveBlock: unexpected jumping out DO_STMT

              end
            end
          end
        end
      end
    end
    return 0
  end

  local l_1_7 = function(l_4_0, l_4_1)
    -- function num : 0_0_2 , upvalues : l_1_1
    do return l_1_1(l_4_0, l_4_1) < 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_8 = function(l_5_0, l_5_1)
    -- function num : 0_0_3 , upvalues : l_1_1
    do return l_1_1(l_5_0, l_5_1) <= 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_9 = function(l_6_0, l_6_1)
    -- function num : 0_0_4 , upvalues : l_1_1
    do return l_1_1(l_6_0, l_6_1) > 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_10 = function(l_7_0, l_7_1)
    -- function num : 0_0_5 , upvalues : l_1_1
    do return l_1_1(l_7_0, l_7_1) >= 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_11 = function(l_8_0)
    -- function num : 0_0_6
    local l_8_1 = (string.match)(l_8_0, "^cpe:2%.3:[aoh]:[^:]+:[^:]+:([^:]+)")
    if l_8_1 == nil or l_8_1 == "*" or l_8_1 == "-" then
      return nil
    end
    return l_8_1
  end

  local l_1_12 = {}
  local l_1_13 = {cve = "CVE-2026-48095", vendor = "igor_pavlov", product = "", vee = "26.01"}
  local l_1_14 = {cve = "CVE-2026-48102", vendor = "igor_pavlov", product = "", vee = "26.01"}
  local l_1_15 = {cve = "CVE-2026-10544", vendor = "devolutions", product = "devolutions_server", vee = "2026.1.21.0"}
  local l_1_16 = {cve = "CVE-2026-10544", vendor = "devolutions", product = "devolutions_server", version = "2026.2.4.0"}
  local l_1_17 = {cve = "CVE-2026-10786", vendor = "devolutions", product = "devolutions_server", vee = "2026.1.21.0"}
  local l_1_18 = {cve = "CVE-2026-10786", vendor = "devolutions", product = "devolutions_server", version = "2026.2.4.0"}
  local l_1_19 = {cve = "CVE-2026-10787", vendor = "devolutions", product = "devolutions_server", vee = "2026.1.21.0"}
  local l_1_20 = {cve = "CVE-2026-10787", vendor = "devolutions", product = "devolutions_server", version = "2026.2.4.0"}
  local l_1_21 = {cve = "CVE-2026-11628", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_22 = {cve = "CVE-2026-11629", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_23 = {cve = "CVE-2026-11630", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_24 = {cve = "CVE-2026-11631", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_25 = {cve = "CVE-2026-11632", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_26 = {cve = "CVE-2026-11633", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_27 = {cve = "CVE-2026-11634", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_28 = {cve = "CVE-2026-11635", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_29 = {cve = "CVE-2026-11636", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_30 = {cve = "CVE-2026-11637", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_31 = {cve = "CVE-2026-11638", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_32 = {cve = "CVE-2026-11639", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_33 = {cve = "CVE-2026-11640", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_34 = {cve = "CVE-2026-11641", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_35 = {cve = "CVE-2026-11642", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_36 = {cve = "CVE-2026-11643", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_37 = {cve = "CVE-2026-11644", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_38 = {cve = "CVE-2026-11645", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_39 = {cve = "CVE-2026-11646", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_40 = {cve = "CVE-2026-11647", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_41 = {cve = "CVE-2026-11648", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_42 = {cve = "CVE-2026-11649", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_43 = {cve = "CVE-2026-11650", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_44 = {cve = "CVE-2026-11651", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_45 = {cve = "CVE-2026-11652", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_46 = {cve = "CVE-2026-11653", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_47 = {cve = "CVE-2026-11654", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_48 = {cve = "CVE-2026-11655", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_49 = {cve = "CVE-2026-11656", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_50 = {cve = "CVE-2026-11657", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_51 = {cve = "CVE-2026-11658", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_52 = {cve = "CVE-2026-11659", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_53 = {cve = "CVE-2026-11660", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_54 = {cve = "CVE-2026-11661", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_55 = {cve = "CVE-2026-11662", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_56 = {cve = "CVE-2026-11663", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  do
    local l_1_57 = {cve = "CVE-2026-11664", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
    -- DECOMPILER ERROR at PC263: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC525: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC799: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC955: Overwrote pending register: R36 in 'AssignReg'

    l_1_41 = {cve = "CVE-2026-44631", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-55968", vendor = "apache", product = "thrift", vee = "0.24.0"}
    l_1_41 = "n8n"
    l_1_41 = "2.29.8"
    -- DECOMPILER ERROR at PC963: Overwrote pending register: R37 in 'AssignReg'

    l_1_42 = {cve = "CVE-2026-46440", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-55969", vendor = "apache", product = "thrift", vee = "0.24.0"}
    l_1_42 = "n8n"
    l_1_42 = "2.30.0"
    -- DECOMPILER ERROR at PC970: Overwrote pending register: R38 in 'AssignReg'

    l_1_43 = {cve = "CVE-2026-46441", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-55971", vendor = "apache", product = "thrift", vee = "0.24.0"}
    l_1_43 = "n8n"
    l_1_43 = "n8n"
    l_1_43 = "1.123.64"
    -- DECOMPILER ERROR at PC979: Overwrote pending register: R39 in 'AssignReg'

    l_1_44 = {cve = "CVE-2026-46442", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58023", vendor = "apache", product = "thrift", vee = "0.24.0"}
    l_1_44 = "n8n"
    l_1_44 = "n8n"
    l_1_44 = "2.30.0"
    -- DECOMPILER ERROR at PC988: Overwrote pending register: R40 in 'AssignReg'

    l_1_45 = {cve = "CVE-2026-46443", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58389", vendor = "apache", product = "thrift", vee = "0.24.0"}
    l_1_45 = "n8n"
    l_1_45 = "n8n"
    l_1_45 = "2.0.0"
    l_1_45 = "2.29.8"
    -- DECOMPILER ERROR at PC999: Overwrote pending register: R41 in 'AssignReg'

    l_1_46 = {cve = "CVE-2026-46444", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58662", vendor = "apache", product = "thrift", vee = "0.24.0"}
    l_1_46 = "n8n"
    l_1_46 = "n8n"
    l_1_46 = "2.29.8"
    -- DECOMPILER ERROR at PC1008: Overwrote pending register: R42 in 'AssignReg'

    l_1_47 = {cve = "CVE-2026-46475", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58163", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
    l_1_47 = "n8n"
    l_1_47 = "n8n"
    l_1_47 = "2.30.0"
    -- DECOMPILER ERROR at PC1017: Overwrote pending register: R43 in 'AssignReg'

    l_1_48 = {cve = "CVE-2026-46476", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58163", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
    l_1_48 = "n8n"
    l_1_48 = "n8n"
    l_1_48 = "1.123.64"
    -- DECOMPILER ERROR at PC1026: Overwrote pending register: R44 in 'AssignReg'

    l_1_49 = {cve = "CVE-2026-46477", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58163", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
    l_1_49 = "n8n"
    l_1_49 = "n8n"
    l_1_49 = "2.30.0"
    -- DECOMPILER ERROR at PC1035: Overwrote pending register: R45 in 'AssignReg'

    l_1_50 = {cve = "CVE-2026-46478", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58177", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
    l_1_50 = "n8n"
    l_1_50 = "n8n"
    l_1_50 = "2.0.0"
    l_1_50 = "2.29.8"
    -- DECOMPILER ERROR at PC1046: Overwrote pending register: R46 in 'AssignReg'

    l_1_51 = {cve = "CVE-2026-46479", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58179", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
    l_1_51 = "n8n"
    l_1_51 = "n8n"
    l_1_51 = "2.29.8"
    -- DECOMPILER ERROR at PC1055: Overwrote pending register: R47 in 'AssignReg'

    l_1_52 = {cve = "CVE-2026-46480", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58179", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
    l_1_52 = "n8n"
    l_1_52 = "n8n"
    l_1_52 = "2.30.0"
    -- DECOMPILER ERROR at PC1064: Overwrote pending register: R48 in 'AssignReg'

    l_1_53 = {cve = "CVE-2026-46490", vendor = "samlify_project", product = "samlify", vee = "2.13.0", cve = "CVE-2026-58179", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
    l_1_53 = "n8n"
    l_1_53 = "n8n"
    l_1_53 = "1.123.64"
    -- DECOMPILER ERROR at PC1073: Overwrote pending register: R49 in 'AssignReg'

    l_1_54 = {cve = "CVE-2026-48507", vendor = "snipeitapp", product = "snipe-it", vee = "8.6.0", cve = "CVE-2026-58183", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
    l_1_54 = "n8n"
    l_1_54 = "n8n"
    l_1_54 = "2.30.0"
    -- DECOMPILER ERROR at PC1082: Overwrote pending register: R50 in 'AssignReg'

    l_1_55 = {cve = "CVE-2026-48913", vendor = "apache", product = "http_server", vsi = "2.4.55", vee = "2.4.68", cve = "CVE-2026-58183", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
    l_1_55 = "n8n"
    l_1_55 = "n8n"
    l_1_55 = "2.0.0"
    l_1_55 = "2.29.8"
    -- DECOMPILER ERROR at PC1093: Overwrote pending register: R51 in 'AssignReg'

    l_1_56 = {cve = "CVE-2026-49233", vendor = "nlnetlabs", product = "routinator", vee = "0.15.2", cve = "CVE-2026-58183", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
    l_1_56 = "n8n"
    l_1_56 = "n8n"
    l_1_56 = "1.123.64"
    -- DECOMPILER ERROR at PC1102: Overwrote pending register: R52 in 'AssignReg'

    l_1_57 = {cve = "CVE-2026-49234", vendor = "nlnetlabs", product = "routinator", vee = "0.15.2", cve = "CVE-2026-58184", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
    l_1_57 = "n8n"
    l_1_57 = "n8n"
    l_1_57 = "2.30.0"
    -- DECOMPILER ERROR at PC1111: Overwrote pending register: R53 in 'AssignReg'

    -- DECOMPILER ERROR at PC1122: Overwrote pending register: R54 in 'AssignReg'

    -- DECOMPILER ERROR at PC1133: Overwrote pending register: R55 in 'AssignReg'

    -- DECOMPILER ERROR at PC1144: Overwrote pending register: R56 in 'AssignReg'

    -- DECOMPILER ERROR at PC1155: Overwrote pending register: R57 in 'AssignReg'

    -- DECOMPILER ERROR at PC1176: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC1178: Overwrote pending register: R9 in 'AssignReg'

    l_1_14 = {cve = "CVE-2026-11671", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-63030", vendor = "wordpress", product = "wordpress", vsi = "7.0.0", vei = "7.0.1", cve = "CVE-2026-58187", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
    l_1_14 = "netty"
    l_1_14 = "netty"
    l_1_14 = "4.2.0"
    l_1_14 = "4.2.16"
    -- DECOMPILER ERROR at PC1189: Overwrote pending register: R10 in 'AssignReg'

    l_1_15 = {cve = "CVE-2026-11672", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-60137", vendor = "wordpress", product = "wordpress", vsi = "6.8.0", vei = "6.8.5", cve = "CVE-2026-58187", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
    l_1_15 = "netty"
    l_1_15 = "netty"
    l_1_15 = "4.1.136"
    -- DECOMPILER ERROR at PC1198: Overwrote pending register: R11 in 'AssignReg'

    l_1_16 = {cve = "CVE-2026-11673", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-60137", vendor = "wordpress", product = "wordpress", vsi = "6.9.0", vei = "6.9.4", cve = "CVE-2026-67216", vendor = "davegamble", product = "cjson", vei = "1.7.19"}
    l_1_16 = "netty"
    l_1_16 = "netty"
    l_1_16 = "4.2.0"
    l_1_16 = "4.2.16"
    -- DECOMPILER ERROR at PC1209: Overwrote pending register: R12 in 'AssignReg'

    l_1_17 = {cve = "CVE-2026-11674", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-60137", vendor = "wordpress", product = "wordpress", vsi = "7.0.0", vei = "7.0.1", cve = "CVE-2026-59941", vendor = "dompdf_project", product = "dompdf", vee = "3.1.6"}
    l_1_17 = "unbound"
    l_1_17 = "1.4.22"
    l_1_17 = "1.25.2"
    -- DECOMPILER ERROR at PC1219: Overwrote pending register: R13 in 'AssignReg'

    l_1_18 = {cve = "CVE-2026-11675", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13774", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-59942", vendor = "dompdf_project", product = "dompdf", vee = "3.1.6"}
    l_1_18 = "nodejs"
    l_1_18 = "undici"
    l_1_18 = "7.29.0"
    -- DECOMPILER ERROR at PC1229: Overwrote pending register: R14 in 'AssignReg'

    l_1_19 = {cve = "CVE-2026-11676", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-13775", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-11897", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.8"}
    l_1_19 = "nodejs"
    l_1_19 = "undici"
    l_1_19 = "8.9.0"
    -- DECOMPILER ERROR at PC1239: Overwrote pending register: R15 in 'AssignReg'

    l_1_20 = {cve = "CVE-2026-11677", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13776", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14529", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.9"}
    l_1_20 = "nodejs"
    l_1_20 = "undici"
    l_1_20 = "7.29.0"
    -- DECOMPILER ERROR at PC1249: Overwrote pending register: R16 in 'AssignReg'

    l_1_21 = {cve = "CVE-2026-11678", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13777", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14529", vendor = "ibm", product = "websphere_application_server", vsi = "8.5.0.0", vee = "8.5.5.31"}
    l_1_21 = "nodejs"
    l_1_21 = "undici"
    l_1_21 = "8.9.0"
    -- DECOMPILER ERROR at PC1259: Overwrote pending register: R17 in 'AssignReg'

    l_1_22 = {cve = "CVE-2026-11679", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13778", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14529", vendor = "ibm", product = "websphere_application_server", vsi = "9.0.0.0", vee = "9.0.5.29"}
    l_1_22 = "progress"
    l_1_22 = "moveit_transfer"
    l_1_22 = "2025.1.5"
    -- DECOMPILER ERROR at PC1268: Overwrote pending register: R18 in 'AssignReg'

    l_1_23 = {cve = "CVE-2026-11680", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13779", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14980", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.9"}
    l_1_23 = "progress"
    l_1_23 = "moveit_transfer"
    l_1_23 = "2026.0.0"
    l_1_23 = "2026.0.3"
    -- DECOMPILER ERROR at PC1279: Overwrote pending register: R19 in 'AssignReg'

    l_1_24 = {cve = "CVE-2026-11681", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-13780", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-16184", vendor = "ibm", product = "websphere_application_server", vsi = "8.5.0.0", vee = "8.5.5.31"}
    l_1_24 = "progress"
    l_1_24 = "moveit_transfer"
    l_1_24 = "2025.1.5"
    -- DECOMPILER ERROR at PC1288: Overwrote pending register: R20 in 'AssignReg'

    l_1_25 = {cve = "CVE-2026-11682", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-13781", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-16184", vendor = "ibm", product = "websphere_application_server", vsi = "9.0.0.0", vee = "9.0.5.29"}
    l_1_25 = "progress"
    l_1_25 = "moveit_transfer"
    l_1_25 = "2026.0.0"
    l_1_25 = "2026.0.3"
    -- DECOMPILER ERROR at PC1299: Overwrote pending register: R21 in 'AssignReg'

    l_1_26 = {cve = "CVE-2026-11683", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13782", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-2482", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.9"}
    l_1_26 = "progress"
    l_1_26 = "moveit_transfer"
    l_1_26 = "2025.1.5"
    -- DECOMPILER ERROR at PC1308: Overwrote pending register: R22 in 'AssignReg'

    l_1_27 = {cve = "CVE-2026-11684", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13783", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-64815", vendor = "jetbrains", product = "intellij_idea", vee = "2026.2"}
    l_1_27 = "progress"
    l_1_27 = "moveit_transfer"
    l_1_27 = "2026.0.0"
    l_1_27 = "2026.0.3"
    -- DECOMPILER ERROR at PC1319: Overwrote pending register: R23 in 'AssignReg'

    l_1_28 = {cve = "CVE-2026-29167", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-13784", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-42016", vendor = "jfrog", product = "artifactory", vee = "7.133.11"}
    l_1_28 = "shopify"
    l_1_28 = "react-router"
    l_1_28 = "7.18.0"
    -- DECOMPILER ERROR at PC1329: Overwrote pending register: R24 in 'AssignReg'

    l_1_29 = {cve = "CVE-2026-29170", vendor = "apache", product = "http_server", vee = "2.4.68", cve = "CVE-2026-13785", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vee = "7.111.18"}
    l_1_29 = "struktur"
    l_1_29 = "libheif"
    l_1_29 = "1.19.0"
    l_1_29 = "1.22.0"
    -- DECOMPILER ERROR at PC1340: Overwrote pending register: R25 in 'AssignReg'

    l_1_30 = {cve = "CVE-2026-34355", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-13786", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.117.0", vee = "7.117.25"}
    l_1_30 = "vercel"
    l_1_30 = "next.js"
    l_1_30 = "13.0.0"
    l_1_30 = "15.5.21"
    -- DECOMPILER ERROR at PC1351: Overwrote pending register: R26 in 'AssignReg'

    l_1_31 = {cve = "CVE-2026-34356", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-13787", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.125.0", vee = "7.125.18"}
    l_1_31 = "vercel"
    l_1_31 = "next.js"
    l_1_31 = "16.0.0"
    l_1_31 = "16.2.11"
    -- DECOMPILER ERROR at PC1362: Overwrote pending register: R27 in 'AssignReg'

    l_1_32 = {cve = "CVE-2026-42535", vendor = "apache", product = "http_server", vee = "2.4.68", cve = "CVE-2026-13788", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.133.0", vee = "7.133.27"}
    l_1_32 = "vercel"
    l_1_32 = "next.js"
    l_1_32 = "16.0.0"
    l_1_32 = "16.2.11"
    -- DECOMPILER ERROR at PC1373: Overwrote pending register: R28 in 'AssignReg'

    l_1_33 = {cve = "CVE-2026-42536", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48374", vendor = "adobe", product = "bridge", vee = "15.1.7", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.146.0", vee = "7.146.34"}
    l_1_33 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1380: Overwrote pending register: R29 in 'AssignReg'

    l_1_34 = {cve = "CVE-2026-42861", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-48374", vendor = "adobe", product = "bridge", vsi = "16.0", vee = "16.0.6", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.161.0", vee = "7.161.15"}
    l_1_34 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1387: Overwrote pending register: R30 in 'AssignReg'

    l_1_35 = {cve = "CVE-2026-42862", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-41608", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-12942", vendor = "langflow", product = "langflow", vsi = "1.0.0", vee = "1.10.2"}
    l_1_35 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1394: Overwrote pending register: R31 in 'AssignReg'

    l_1_36 = {cve = "CVE-2026-42863", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-43871", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-15789", vendor = "mobyproject", product = "buildkit", vee = "0.31.2"}
    l_1_36 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1401: Overwrote pending register: R32 in 'AssignReg'

    l_1_37 = {cve = "CVE-2026-43951", vendor = "apache", product = "http_server", vsi = "2.4.0", vei = "2.4.67", cve = "CVE-2026-45112", vendor = "apache", product = "thrift", vsi = "0.19.0", vee = "0.24.0", cve = "CVE-2026-15791", vendor = "mobyproject", product = "buildkit", vee = "0.31.2"}
    l_1_37 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1408: Overwrote pending register: R33 in 'AssignReg'

    l_1_38 = {cve = "CVE-2026-44119", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48144", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-15792", vendor = "mobyproject", product = "buildkit", vee = "0.31.2"}
    l_1_38 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1415: Overwrote pending register: R34 in 'AssignReg'

    l_1_39 = {cve = "CVE-2026-44185", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48145", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-15793", vendor = "mobyproject", product = "buildkit", vsi = "0.30.0", vee = "0.31.2"}
    l_1_39 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1422: Overwrote pending register: R35 in 'AssignReg'

    l_1_40 = {cve = "CVE-2026-44186", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48586", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-65015", vendor = l_1_41, product = l_1_41, vee = l_1_41}
    l_1_40 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1429: Overwrote pending register: R36 in 'AssignReg'

    l_1_41 = {cve = "CVE-2026-65015", vendor = l_1_42, product = l_1_42, version = l_1_42}
    l_1_41 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1436: Overwrote pending register: R37 in 'AssignReg'

    l_1_42 = {cve = l_1_43, vendor = l_1_43, product = l_1_43, vee = l_1_43}
    l_1_42 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1443: Overwrote pending register: R38 in 'AssignReg'

    l_1_43 = {cve = l_1_44, vendor = l_1_44, product = l_1_44, version = l_1_44}
    l_1_43 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1450: Overwrote pending register: R39 in 'AssignReg'

    l_1_44 = {cve = l_1_45, vendor = l_1_45, product = l_1_45, vsi = l_1_45, vee = l_1_45}
    l_1_44 = "150.0.7871.182"
    -- DECOMPILER ERROR at PC1457: Overwrote pending register: R40 in 'AssignReg'

    l_1_45 = {cve = l_1_46, vendor = l_1_46, product = l_1_46, vee = l_1_46}
    l_1_45 = "mozilla"
    l_1_45 = "firefox"
    l_1_45 = "153.0"
    -- DECOMPILER ERROR at PC1466: Overwrote pending register: R41 in 'AssignReg'

    l_1_46 = {cve = l_1_47, vendor = l_1_47, product = l_1_47, version = l_1_47}
    l_1_46 = "mozilla"
    l_1_46 = "firefox"
    l_1_46 = "153.0"
    -- DECOMPILER ERROR at PC1475: Overwrote pending register: R42 in 'AssignReg'

    l_1_47 = {cve = l_1_48, vendor = l_1_48, product = l_1_48, vee = l_1_48}
    l_1_47 = "mozilla"
    l_1_47 = "firefox"
    l_1_47 = "153.0"
    -- DECOMPILER ERROR at PC1484: Overwrote pending register: R43 in 'AssignReg'

    l_1_48 = {cve = l_1_49, vendor = l_1_49, product = l_1_49, version = l_1_49}
    l_1_48 = "mozilla"
    l_1_48 = "firefox"
    l_1_48 = "153.0"
    -- DECOMPILER ERROR at PC1493: Overwrote pending register: R44 in 'AssignReg'

    l_1_49 = {cve = l_1_50, vendor = l_1_50, product = l_1_50, vsi = l_1_50, vee = l_1_50}
    l_1_49 = "mozilla"
    l_1_49 = "firefox"
    l_1_49 = "153.0"
    -- DECOMPILER ERROR at PC1502: Overwrote pending register: R45 in 'AssignReg'

    l_1_50 = {cve = l_1_51, vendor = l_1_51, product = l_1_51, vee = l_1_51}
    l_1_50 = "mozilla"
    l_1_50 = "firefox"
    l_1_50 = "153.0"
    -- DECOMPILER ERROR at PC1511: Overwrote pending register: R46 in 'AssignReg'

    l_1_51 = {cve = l_1_52, vendor = l_1_52, product = l_1_52, version = l_1_52}
    l_1_51 = "mozilla"
    l_1_51 = "firefox"
    l_1_51 = "153.0"
    -- DECOMPILER ERROR at PC1520: Overwrote pending register: R47 in 'AssignReg'

    l_1_52 = {cve = l_1_53, vendor = l_1_53, product = l_1_53, vee = l_1_53}
    l_1_52 = "mozilla"
    l_1_52 = "firefox"
    l_1_52 = "153.0"
    -- DECOMPILER ERROR at PC1529: Overwrote pending register: R48 in 'AssignReg'

    l_1_53 = {cve = l_1_54, vendor = l_1_54, product = l_1_54, version = l_1_54}
    l_1_53 = "mozilla"
    l_1_53 = "firefox"
    l_1_53 = "153.0"
    -- DECOMPILER ERROR at PC1538: Overwrote pending register: R49 in 'AssignReg'

    l_1_54 = {cve = l_1_55, vendor = l_1_55, product = l_1_55, vsi = l_1_55, vee = l_1_55}
    l_1_54 = "mozilla"
    l_1_54 = "firefox"
    l_1_54 = "153.0"
    -- DECOMPILER ERROR at PC1547: Overwrote pending register: R50 in 'AssignReg'

    l_1_55 = {cve = l_1_56, vendor = l_1_56, product = l_1_56, vee = l_1_56}
    l_1_55 = "mozilla"
    l_1_55 = "firefox"
    l_1_55 = "153.0"
    -- DECOMPILER ERROR at PC1556: Overwrote pending register: R51 in 'AssignReg'

    l_1_56 = {cve = l_1_57, vendor = l_1_57, product = l_1_57, version = l_1_57}
    l_1_56 = "mozilla"
    l_1_56 = "firefox"
    l_1_56 = "153.0"
    -- DECOMPILER ERROR at PC1565: Overwrote pending register: R52 in 'AssignReg'

    l_1_57 = {
cve = {cve = "CVE-2026-11665", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-49235", vendor = "nlnetlabs", product = "routinator", vee = "0.15.2", cve = "CVE-2026-58184", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
, vendor = "n8n", product = "n8n", vsi = "2.0.0", vee = "2.29.8"}
    l_1_57 = "mozilla"
    l_1_57 = "firefox"
    l_1_57 = "153.0"
    -- DECOMPILER ERROR at PC1574: Overwrote pending register: R53 in 'AssignReg'

    -- DECOMPILER ERROR at PC1583: Overwrote pending register: R54 in 'AssignReg'

    -- DECOMPILER ERROR at PC1592: Overwrote pending register: R55 in 'AssignReg'

    -- DECOMPILER ERROR at PC1601: Overwrote pending register: R56 in 'AssignReg'

    -- DECOMPILER ERROR at PC1610: Overwrote pending register: R57 in 'AssignReg'

    -- DECOMPILER ERROR at PC1627: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC1629: Overwrote pending register: R9 in 'AssignReg'

    l_1_14 = {cve = l_1_15, vendor = l_1_15, product = l_1_15, vee = l_1_15}
    l_1_14 = "mozilla"
    l_1_14 = "firefox"
    l_1_14 = "153.0"
    -- DECOMPILER ERROR at PC1638: Overwrote pending register: R10 in 'AssignReg'

    l_1_15 = {cve = l_1_16, vendor = l_1_16, product = l_1_16, vsi = l_1_16, vee = l_1_16}
    l_1_15 = "mozilla"
    l_1_15 = "firefox_esr"
    l_1_15 = "115.0"
    l_1_15 = "115.38"
    -- DECOMPILER ERROR at PC1649: Overwrote pending register: R11 in 'AssignReg'

    l_1_16 = {cve = l_1_17, vendor = "nlnetlabs", product = l_1_17, vsi = l_1_17, vee = l_1_17}
    l_1_16 = "mozilla"
    l_1_16 = "firefox_esr"
    l_1_16 = "140.0"
    l_1_16 = "140.13"
    -- DECOMPILER ERROR at PC1660: Overwrote pending register: R12 in 'AssignReg'

    l_1_17 = {cve = l_1_18, vendor = l_1_18, product = l_1_18, vsi = "7.0.0", vee = l_1_18}
    l_1_17 = "mozilla"
    l_1_17 = "firefox_esr"
    l_1_17 = "140.0"
    l_1_17 = "140.13"
    -- DECOMPILER ERROR at PC1670: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC1672: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC1673: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC1674: Confused about usage of register: R9 in 'OutputAssignments'

    for l_1_17,l_1_18 in l_1_14 do
      l_1_16 = {cve = l_1_17, vendor = l_1_17, product = l_1_17, vsi = l_1_17, vee = l_1_17}
      -- DECOMPILER ERROR at PC1676: Overwrote pending register: R14 in 'AssignReg'

      l_1_18 = {cve = l_1_19, vendor = l_1_19, product = l_1_19, vsi = "8.0.0", vee = l_1_19}
      -- DECOMPILER ERROR at PC1677: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC1678: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC1679: Overwrote pending register: R14 in 'AssignReg'

      l_1_21, l_1_20, l_1_19 = {cve = l_1_22, vendor = l_1_22, product = l_1_22, vee = l_1_22}, {cve = l_1_21, vendor = l_1_21, product = l_1_21, vsi = "8.0.0", vee = l_1_21}, {cve = l_1_20, vendor = l_1_20, product = l_1_20, vsi = "7.0.0", vee = l_1_20}
      l_1_20, l_1_13 = l_1_13[l_1_19], {cve = "CVE-2026-11670", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-63030", vendor = "wordpress", product = "wordpress", vsi = "6.9.0", vei = "6.9.4", cve = "CVE-2026-58187", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4", cve = l_1_14, vendor = l_1_14, product = l_1_14, vsi = l_1_14, vee = l_1_14, cve = l_1_14, vendor = l_1_14, product = l_1_14, vee = l_1_14}
      l_1_21 = nil
      if l_1_20 == l_1_21 then
        l_1_21 = l_1_18.vendor
        l_1_21 = l_1_18.product
        l_1_21 = "rs"
        l_1_22 = {cve = l_1_23, vendor = l_1_23, product = l_1_23, vsi = l_1_23, vee = l_1_23}
        l_1_20 = {vendor = l_1_21, product = l_1_21, [l_1_21] = l_1_22}
      end
      l_1_20 = l_1_13[l_1_19]
      l_1_21 = "rs"
      l_1_20 = l_1_20[l_1_21]
      l_1_21 = l_1_13[l_1_19]
      l_1_22 = "rs"
      l_1_21 = l_1_21[l_1_22]
      l_1_21 = #l_1_21
      l_1_22 = 1
      l_1_21 = l_1_21 + l_1_22
    end
    for i_1,l_1_19 in pairs(l_1_13) do
      -- DECOMPILER ERROR at PC1716: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC1717: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC1720: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC1721: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC1723: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC1726: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC1727: Overwrote pending register: R17 in 'AssignReg'

      if l_1_21 == l_1_22 then
        for l_1_24,l_1_25 in l_1_21 do
          -- DECOMPILER ERROR at PC1730: Overwrote pending register: R21 in 'AssignReg'

          -- DECOMPILER ERROR at PC1731: Overwrote pending register: R22 in 'AssignReg'

          -- DECOMPILER ERROR at PC1733: Overwrote pending register: R22 in 'AssignReg'

          -- DECOMPILER ERROR at PC1736: Overwrote pending register: R22 in 'AssignReg'

          -- DECOMPILER ERROR at PC1737: Overwrote pending register: R23 in 'AssignReg'

          -- DECOMPILER ERROR at PC1738: Overwrote pending register: R23 in 'AssignReg'

          if l_1_26 ~= l_1_27 then
            for l_1_30,l_1_31 in l_1_27 do
              -- DECOMPILER ERROR at PC1741: Overwrote pending register: R27 in 'AssignReg'

              -- DECOMPILER ERROR at PC1742: Overwrote pending register: R28 in 'AssignReg'

              l_1_31 = {cve = l_1_32, vendor = l_1_32, product = l_1_32, vsi = l_1_32, vee = l_1_32}
              -- DECOMPILER ERROR at PC1743: Overwrote pending register: R29 in 'AssignReg'

              -- DECOMPILER ERROR at PC1744: Confused about usage of register: R27 in 'OutputAssignments'

              if l_1_32 then
                l_1_32 = inventory
                l_1_33 = "AddVulnerability"
                l_1_32 = l_1_32[l_1_33]
                l_1_33 = l_1_25
                l_1_34 = l_1_31.cve
                l_1_32(l_1_33, l_1_34)
              end
            end
          end
        end
      end
    end
    -- DECOMPILER ERROR at PC1759: Confused about usage of register R26 for local variables in 'ReleaseLocals'

  end
end
)
  if not l_0_1 then
    l_0_0.InventoryCveTagging = l_0_2
    if l_0_2 == "Scanning aborted by the user!" then
      error((MpCommon.JsonSerialize)(l_0_0))
    end
  end
end
if next(l_0_0) ~= nil then
  error((MpCommon.JsonSerialize)(l_0_0))
end

