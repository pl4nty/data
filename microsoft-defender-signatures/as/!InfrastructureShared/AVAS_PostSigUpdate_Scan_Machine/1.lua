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
    l_2_2 = l_2_2(l_2_0 or "", "[^._]+")
    for i_1 in l_2_2 do
      l_2_1[#l_2_1 + 1] = i_1
    end
    do return l_2_1 end
    -- DECOMPILER ERROR at PC15: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end

  local l_1_1 = function(l_3_0)
    -- function num : 0_0_1
    if (string.match)(l_3_0, "^%d+$") == nil then
      return nil
    end
    local l_3_1 = tonumber
    local l_3_3 = string.gsub
    local l_3_4 = l_3_0
    do
      local l_3_5 = "^0+(%d)"
      l_3_3 = l_3_3(l_3_4, l_3_5, "%1")
      local l_3_2 = nil
      do return l_3_1(l_3_3) end
      -- DECOMPILER ERROR at PC18: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end

  local l_1_7 = function(l_4_0, l_4_1)
    -- function num : 0_0_2 , upvalues : l_1_0, l_1_1
    local l_4_2 = l_1_0(l_4_0)
    local l_4_3 = (l_1_0(l_4_1))
    local l_4_4 = nil
    if #l_4_2 < #l_4_3 then
      l_4_4 = #l_4_3
    else
      l_4_4 = #l_4_2
    end
    for l_4_8 = 1, l_4_4 do
      do
        local l_4_9, l_4_10, l_4_12 = l_4_2[l_4_8] or "0"
        do
          local l_4_11, l_4_13 = , l_4_3[l_4_8] or "0"
          -- DECOMPILER ERROR at PC27: Confused about usage of register: R9 in 'UnsetPending'

          local l_4_14 = nil
          -- DECOMPILER ERROR at PC30: Confused about usage of register: R10 in 'UnsetPending'

          local l_4_15 = nil
          -- DECOMPILER ERROR at PC43: Unhandled construct in 'MakeBoolean' P1

          if l_1_1(l_4_11) >= l_1_1(l_4_13) or not -1 then
            do return not l_1_1(l_4_11) or not l_1_1(l_4_13) or l_1_1(l_4_11) == l_1_1(l_4_13) or 1 end
            if l_4_14 >= l_4_15 or not -1 then
              do
                do return l_4_14 == l_4_15 or 1 end
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

  local l_1_8 = function(l_5_0, l_5_1)
    -- function num : 0_0_3 , upvalues : l_1_2
    do return l_1_2(l_5_0, l_5_1) < 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_9 = function(l_6_0, l_6_1)
    -- function num : 0_0_4 , upvalues : l_1_2
    do return l_1_2(l_6_0, l_6_1) <= 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_10 = function(l_7_0, l_7_1)
    -- function num : 0_0_5 , upvalues : l_1_2
    do return l_1_2(l_7_0, l_7_1) > 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_11 = function(l_8_0, l_8_1)
    -- function num : 0_0_6 , upvalues : l_1_2
    do return l_1_2(l_8_0, l_8_1) >= 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local l_1_12 = function(l_9_0)
    -- function num : 0_0_7
    local l_9_1 = (string.match)(l_9_0, "^cpe:2%.3:[aoh]:[^:]+:[^:]+:([^:]+)")
    if l_9_1 == nil or l_9_1 == "*" or l_9_1 == "-" then
      return nil
    end
    return l_9_1
  end

  local l_1_13 = {}
  local l_1_14 = {cve = "CVE-2026-48095", vendor = "igor_pavlov", product = "", vee = "26.01"}
  local l_1_15 = {cve = "CVE-2026-48102", vendor = "igor_pavlov", product = "", vee = "26.01"}
  local l_1_16 = {cve = "CVE-2026-10544", vendor = "devolutions", product = "devolutions_server", vee = "2026.1.21.0"}
  local l_1_17 = {cve = "CVE-2026-10544", vendor = "devolutions", product = "devolutions_server", version = "2026.2.4.0"}
  local l_1_18 = {cve = "CVE-2026-10786", vendor = "devolutions", product = "devolutions_server", vee = "2026.1.21.0"}
  local l_1_19 = {cve = "CVE-2026-10786", vendor = "devolutions", product = "devolutions_server", version = "2026.2.4.0"}
  local l_1_20 = {cve = "CVE-2026-10787", vendor = "devolutions", product = "devolutions_server", vee = "2026.1.21.0"}
  local l_1_21 = {cve = "CVE-2026-10787", vendor = "devolutions", product = "devolutions_server", version = "2026.2.4.0"}
  local l_1_22 = {cve = "CVE-2026-11628", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_23 = {cve = "CVE-2026-11629", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_24 = {cve = "CVE-2026-11630", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_25 = {cve = "CVE-2026-11631", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_26 = {cve = "CVE-2026-11632", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_27 = {cve = "CVE-2026-11633", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_28 = {cve = "CVE-2026-11634", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_29 = {cve = "CVE-2026-11635", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_30 = {cve = "CVE-2026-11636", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_31 = {cve = "CVE-2026-11637", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_32 = {cve = "CVE-2026-11638", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_33 = {cve = "CVE-2026-11639", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_34 = {cve = "CVE-2026-11640", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_35 = {cve = "CVE-2026-11641", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_36 = {cve = "CVE-2026-11642", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_37 = {cve = "CVE-2026-11643", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_38 = {cve = "CVE-2026-11644", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_39 = {cve = "CVE-2026-11645", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_40 = {cve = "CVE-2026-11646", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_41 = {cve = "CVE-2026-11647", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_42 = {cve = "CVE-2026-11648", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_43 = {cve = "CVE-2026-11649", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_44 = {cve = "CVE-2026-11650", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_45 = {cve = "CVE-2026-11651", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_46 = {cve = "CVE-2026-11652", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_47 = {cve = "CVE-2026-11653", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_48 = {cve = "CVE-2026-11654", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_49 = {cve = "CVE-2026-11655", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_50 = {cve = "CVE-2026-11656", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_51 = {cve = "CVE-2026-11657", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_52 = {cve = "CVE-2026-11658", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_53 = {cve = "CVE-2026-11659", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_54 = {cve = "CVE-2026-11660", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_55 = {cve = "CVE-2026-11661", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_56 = {cve = "CVE-2026-11662", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_57 = {cve = "CVE-2026-11663", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  local l_1_58 = {cve = "CVE-2026-11664", vendor = "google", product = "chrome", vee = "149.0.7827.103"}
  -- DECOMPILER ERROR at PC265: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC527: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC801: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC957: Overwrote pending register: R37 in 'AssignReg'

  l_1_42 = {cve = "CVE-2026-44631", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-55968", vendor = "apache", product = "thrift", vee = "0.24.0"}
  l_1_42 = "n8n"
  l_1_42 = "2.29.8"
  -- DECOMPILER ERROR at PC965: Overwrote pending register: R38 in 'AssignReg'

  l_1_43 = {cve = "CVE-2026-46440", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-55969", vendor = "apache", product = "thrift", vee = "0.24.0"}
  l_1_43 = "n8n"
  l_1_43 = "2.30.0"
  -- DECOMPILER ERROR at PC972: Overwrote pending register: R39 in 'AssignReg'

  l_1_44 = {cve = "CVE-2026-46441", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-55971", vendor = "apache", product = "thrift", vee = "0.24.0"}
  l_1_44 = "n8n"
  l_1_44 = "n8n"
  l_1_44 = "1.123.64"
  -- DECOMPILER ERROR at PC981: Overwrote pending register: R40 in 'AssignReg'

  l_1_45 = {cve = "CVE-2026-46442", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58023", vendor = "apache", product = "thrift", vee = "0.24.0"}
  l_1_45 = "n8n"
  l_1_45 = "n8n"
  l_1_45 = "2.30.0"
  -- DECOMPILER ERROR at PC990: Overwrote pending register: R41 in 'AssignReg'

  l_1_46 = {cve = "CVE-2026-46443", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58389", vendor = "apache", product = "thrift", vee = "0.24.0"}
  l_1_46 = "n8n"
  l_1_46 = "n8n"
  l_1_46 = "2.0.0"
  l_1_46 = "2.29.8"
  -- DECOMPILER ERROR at PC1001: Overwrote pending register: R42 in 'AssignReg'

  l_1_47 = {cve = "CVE-2026-46444", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58662", vendor = "apache", product = "thrift", vee = "0.24.0"}
  l_1_47 = "n8n"
  l_1_47 = "n8n"
  l_1_47 = "2.29.8"
  -- DECOMPILER ERROR at PC1010: Overwrote pending register: R43 in 'AssignReg'

  l_1_48 = {cve = "CVE-2026-46475", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58163", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
  l_1_48 = "n8n"
  l_1_48 = "n8n"
  l_1_48 = "2.30.0"
  -- DECOMPILER ERROR at PC1019: Overwrote pending register: R44 in 'AssignReg'

  l_1_49 = {cve = "CVE-2026-46476", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58163", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
  l_1_49 = "n8n"
  l_1_49 = "n8n"
  l_1_49 = "1.123.64"
  -- DECOMPILER ERROR at PC1028: Overwrote pending register: R45 in 'AssignReg'

  l_1_50 = {cve = "CVE-2026-46477", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58163", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
  l_1_50 = "n8n"
  l_1_50 = "n8n"
  l_1_50 = "2.30.0"
  -- DECOMPILER ERROR at PC1037: Overwrote pending register: R46 in 'AssignReg'

  l_1_51 = {cve = "CVE-2026-46478", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58177", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
  l_1_51 = "n8n"
  l_1_51 = "n8n"
  l_1_51 = "2.0.0"
  l_1_51 = "2.29.8"
  -- DECOMPILER ERROR at PC1048: Overwrote pending register: R47 in 'AssignReg'

  l_1_52 = {cve = "CVE-2026-46479", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58179", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
  l_1_52 = "n8n"
  l_1_52 = "n8n"
  l_1_52 = "2.29.8"
  -- DECOMPILER ERROR at PC1057: Overwrote pending register: R48 in 'AssignReg'

  l_1_53 = {cve = "CVE-2026-46480", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-58179", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
  l_1_53 = "n8n"
  l_1_53 = "n8n"
  l_1_53 = "2.30.0"
  -- DECOMPILER ERROR at PC1066: Overwrote pending register: R49 in 'AssignReg'

  l_1_54 = {cve = "CVE-2026-46490", vendor = "samlify_project", product = "samlify", vee = "2.13.0", cve = "CVE-2026-58179", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
  l_1_54 = "n8n"
  l_1_54 = "n8n"
  l_1_54 = "1.123.64"
  -- DECOMPILER ERROR at PC1075: Overwrote pending register: R50 in 'AssignReg'

  l_1_55 = {cve = "CVE-2026-48507", vendor = "snipeitapp", product = "snipe-it", vee = "8.6.0", cve = "CVE-2026-58183", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
  l_1_55 = "n8n"
  l_1_55 = "n8n"
  l_1_55 = "2.30.0"
  -- DECOMPILER ERROR at PC1084: Overwrote pending register: R51 in 'AssignReg'

  l_1_56 = {cve = "CVE-2026-48913", vendor = "apache", product = "http_server", vsi = "2.4.55", vee = "2.4.68", cve = "CVE-2026-58183", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
  l_1_56 = "n8n"
  l_1_56 = "n8n"
  l_1_56 = "2.0.0"
  l_1_56 = "2.29.8"
  -- DECOMPILER ERROR at PC1095: Overwrote pending register: R52 in 'AssignReg'

  l_1_57 = {cve = "CVE-2026-49233", vendor = "nlnetlabs", product = "routinator", vee = "0.15.2", cve = "CVE-2026-58183", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
  l_1_57 = "n8n"
  l_1_57 = "n8n"
  l_1_57 = "1.123.64"
  -- DECOMPILER ERROR at PC1104: Overwrote pending register: R53 in 'AssignReg'

  l_1_58 = {cve = "CVE-2026-49234", vendor = "nlnetlabs", product = "routinator", vee = "0.15.2", cve = "CVE-2026-58184", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
  l_1_58 = "n8n"
  l_1_58 = "n8n"
  l_1_58 = "2.30.0"
  -- DECOMPILER ERROR at PC1113: Overwrote pending register: R54 in 'AssignReg'

  -- DECOMPILER ERROR at PC1124: Overwrote pending register: R55 in 'AssignReg'

  -- DECOMPILER ERROR at PC1135: Overwrote pending register: R56 in 'AssignReg'

  -- DECOMPILER ERROR at PC1146: Overwrote pending register: R57 in 'AssignReg'

  -- DECOMPILER ERROR at PC1157: Overwrote pending register: R58 in 'AssignReg'

  -- DECOMPILER ERROR at PC1178: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC1180: Overwrote pending register: R10 in 'AssignReg'

  l_1_15 = {cve = "CVE-2026-11671", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-63030", vendor = "wordpress", product = "wordpress", vsi = "7.0.0", vei = "7.0.1", cve = "CVE-2026-58187", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
  l_1_15 = "netty"
  l_1_15 = "netty"
  l_1_15 = "4.2.0"
  l_1_15 = "4.2.16"
  -- DECOMPILER ERROR at PC1191: Overwrote pending register: R11 in 'AssignReg'

  l_1_16 = {cve = "CVE-2026-11672", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-60137", vendor = "wordpress", product = "wordpress", vsi = "6.8.0", vei = "6.8.5", cve = "CVE-2026-58187", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
  l_1_16 = "netty"
  l_1_16 = "netty"
  l_1_16 = "4.1.136"
  -- DECOMPILER ERROR at PC1200: Overwrote pending register: R12 in 'AssignReg'

  l_1_17 = {cve = "CVE-2026-11673", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-60137", vendor = "wordpress", product = "wordpress", vsi = "6.9.0", vei = "6.9.4", cve = "CVE-2026-67216", vendor = "davegamble", product = "cjson", vei = "1.7.19"}
  l_1_17 = "netty"
  l_1_17 = "netty"
  l_1_17 = "4.2.0"
  l_1_17 = "4.2.16"
  -- DECOMPILER ERROR at PC1211: Overwrote pending register: R13 in 'AssignReg'

  l_1_18 = {cve = "CVE-2026-11674", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-60137", vendor = "wordpress", product = "wordpress", vsi = "7.0.0", vei = "7.0.1", cve = "CVE-2026-59941", vendor = "dompdf_project", product = "dompdf", vee = "3.1.6"}
  l_1_18 = "unbound"
  l_1_18 = "1.4.22"
  l_1_18 = "1.25.2"
  -- DECOMPILER ERROR at PC1221: Overwrote pending register: R14 in 'AssignReg'

  l_1_19 = {cve = "CVE-2026-11675", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13774", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-59942", vendor = "dompdf_project", product = "dompdf", vee = "3.1.6"}
  l_1_19 = "nodejs"
  l_1_19 = "undici"
  l_1_19 = "7.29.0"
  -- DECOMPILER ERROR at PC1231: Overwrote pending register: R15 in 'AssignReg'

  l_1_20 = {cve = "CVE-2026-11676", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-13775", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-11897", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.8"}
  l_1_20 = "nodejs"
  l_1_20 = "undici"
  l_1_20 = "8.9.0"
  -- DECOMPILER ERROR at PC1241: Overwrote pending register: R16 in 'AssignReg'

  l_1_21 = {cve = "CVE-2026-11677", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13776", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14529", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.9"}
  l_1_21 = "nodejs"
  l_1_21 = "undici"
  l_1_21 = "7.29.0"
  -- DECOMPILER ERROR at PC1251: Overwrote pending register: R17 in 'AssignReg'

  l_1_22 = {cve = "CVE-2026-11678", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13777", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14529", vendor = "ibm", product = "websphere_application_server", vsi = "8.5.0.0", vee = "8.5.5.31"}
  l_1_22 = "nodejs"
  l_1_22 = "undici"
  l_1_22 = "8.9.0"
  -- DECOMPILER ERROR at PC1261: Overwrote pending register: R18 in 'AssignReg'

  l_1_23 = {cve = "CVE-2026-11679", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13778", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14529", vendor = "ibm", product = "websphere_application_server", vsi = "9.0.0.0", vee = "9.0.5.29"}
  l_1_23 = "progress"
  l_1_23 = "moveit_transfer"
  l_1_23 = "2025.1.5"
  -- DECOMPILER ERROR at PC1270: Overwrote pending register: R19 in 'AssignReg'

  l_1_24 = {cve = "CVE-2026-11680", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13779", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-14980", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.9"}
  l_1_24 = "progress"
  l_1_24 = "moveit_transfer"
  l_1_24 = "2026.0.0"
  l_1_24 = "2026.0.3"
  -- DECOMPILER ERROR at PC1281: Overwrote pending register: R20 in 'AssignReg'

  l_1_25 = {cve = "CVE-2026-11681", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-13780", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-16184", vendor = "ibm", product = "websphere_application_server", vsi = "8.5.0.0", vee = "8.5.5.31"}
  l_1_25 = "progress"
  l_1_25 = "moveit_transfer"
  l_1_25 = "2025.1.5"
  -- DECOMPILER ERROR at PC1290: Overwrote pending register: R21 in 'AssignReg'

  l_1_26 = {cve = "CVE-2026-11682", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-13781", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-16184", vendor = "ibm", product = "websphere_application_server", vsi = "9.0.0.0", vee = "9.0.5.29"}
  l_1_26 = "progress"
  l_1_26 = "moveit_transfer"
  l_1_26 = "2026.0.0"
  l_1_26 = "2026.0.3"
  -- DECOMPILER ERROR at PC1301: Overwrote pending register: R22 in 'AssignReg'

  l_1_27 = {cve = "CVE-2026-11683", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13782", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-2482", vendor = "ibm", product = "websphere_application_server", vsi = "17.0.0.3", vee = "26.0.0.9"}
  l_1_27 = "progress"
  l_1_27 = "moveit_transfer"
  l_1_27 = "2025.1.5"
  -- DECOMPILER ERROR at PC1310: Overwrote pending register: R23 in 'AssignReg'

  l_1_28 = {cve = "CVE-2026-11684", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13783", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-64815", vendor = "jetbrains", product = "intellij_idea", vee = "2026.2"}
  l_1_28 = "progress"
  l_1_28 = "moveit_transfer"
  l_1_28 = "2026.0.0"
  l_1_28 = "2026.0.3"
  -- DECOMPILER ERROR at PC1321: Overwrote pending register: R24 in 'AssignReg'

  l_1_29 = {cve = "CVE-2026-29167", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-13784", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-42016", vendor = "jfrog", product = "artifactory", vee = "7.133.11"}
  l_1_29 = "shopify"
  l_1_29 = "react-router"
  l_1_29 = "7.18.0"
  -- DECOMPILER ERROR at PC1331: Overwrote pending register: R25 in 'AssignReg'

  l_1_30 = {cve = "CVE-2026-29170", vendor = "apache", product = "http_server", vee = "2.4.68", cve = "CVE-2026-13785", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vee = "7.111.18"}
  l_1_30 = "struktur"
  l_1_30 = "libheif"
  l_1_30 = "1.19.0"
  l_1_30 = "1.22.0"
  -- DECOMPILER ERROR at PC1342: Overwrote pending register: R26 in 'AssignReg'

  l_1_31 = {cve = "CVE-2026-34355", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-13786", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.117.0", vee = "7.117.25"}
  l_1_31 = "vercel"
  l_1_31 = "next.js"
  l_1_31 = "13.0.0"
  l_1_31 = "15.5.21"
  -- DECOMPILER ERROR at PC1353: Overwrote pending register: R27 in 'AssignReg'

  l_1_32 = {cve = "CVE-2026-34356", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-13787", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.125.0", vee = "7.125.18"}
  l_1_32 = "vercel"
  l_1_32 = "next.js"
  l_1_32 = "16.0.0"
  l_1_32 = "16.2.11"
  -- DECOMPILER ERROR at PC1364: Overwrote pending register: R28 in 'AssignReg'

  l_1_33 = {cve = "CVE-2026-42535", vendor = "apache", product = "http_server", vee = "2.4.68", cve = "CVE-2026-13788", vendor = "google", product = "chrome", vee = "150.0.7871.114", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.133.0", vee = "7.133.27"}
  l_1_33 = "vercel"
  l_1_33 = "next.js"
  l_1_33 = "16.0.0"
  l_1_33 = "16.2.11"
  -- DECOMPILER ERROR at PC1375: Overwrote pending register: R29 in 'AssignReg'

  l_1_34 = {cve = "CVE-2026-42536", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48374", vendor = "adobe", product = "bridge", vee = "15.1.7", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.146.0", vee = "7.146.34"}
  l_1_34 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1382: Overwrote pending register: R30 in 'AssignReg'

  l_1_35 = {cve = "CVE-2026-42861", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-48374", vendor = "adobe", product = "bridge", vsi = "16.0", vee = "16.0.6", cve = "CVE-2026-66014", vendor = "jfrog", product = "artifactory", vsi = "7.161.0", vee = "7.161.15"}
  l_1_35 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1389: Overwrote pending register: R31 in 'AssignReg'

  l_1_36 = {cve = "CVE-2026-42862", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-41608", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-12942", vendor = "langflow", product = "langflow", vsi = "1.0.0", vee = "1.10.2"}
  l_1_36 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1396: Overwrote pending register: R32 in 'AssignReg'

  l_1_37 = {cve = "CVE-2026-42863", vendor = "flowiseai", product = "flowise", vee = "3.1.2", cve = "CVE-2026-43871", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-15789", vendor = "mobyproject", product = "buildkit", vee = "0.31.2"}
  l_1_37 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1403: Overwrote pending register: R33 in 'AssignReg'

  l_1_38 = {cve = "CVE-2026-43951", vendor = "apache", product = "http_server", vsi = "2.4.0", vei = "2.4.67", cve = "CVE-2026-45112", vendor = "apache", product = "thrift", vsi = "0.19.0", vee = "0.24.0", cve = "CVE-2026-15791", vendor = "mobyproject", product = "buildkit", vee = "0.31.2"}
  l_1_38 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1410: Overwrote pending register: R34 in 'AssignReg'

  l_1_39 = {cve = "CVE-2026-44119", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48144", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-15792", vendor = "mobyproject", product = "buildkit", vee = "0.31.2"}
  l_1_39 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1417: Overwrote pending register: R35 in 'AssignReg'

  l_1_40 = {cve = "CVE-2026-44185", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48145", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-15793", vendor = "mobyproject", product = "buildkit", vsi = "0.30.0", vee = "0.31.2"}
  l_1_40 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1424: Overwrote pending register: R36 in 'AssignReg'

  l_1_41 = {cve = "CVE-2026-44186", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-48586", vendor = "apache", product = "thrift", vee = "0.24.0", cve = "CVE-2026-65015", vendor = l_1_42, product = l_1_42, vee = l_1_42}
  l_1_41 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1431: Overwrote pending register: R37 in 'AssignReg'

  l_1_42 = {cve = "CVE-2026-65015", vendor = l_1_43, product = l_1_43, version = l_1_43}
  l_1_42 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1438: Overwrote pending register: R38 in 'AssignReg'

  l_1_43 = {cve = l_1_44, vendor = l_1_44, product = l_1_44, vee = l_1_44}
  l_1_43 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1445: Overwrote pending register: R39 in 'AssignReg'

  l_1_44 = {cve = l_1_45, vendor = l_1_45, product = l_1_45, version = l_1_45}
  l_1_44 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1452: Overwrote pending register: R40 in 'AssignReg'

  l_1_45 = {cve = l_1_46, vendor = l_1_46, product = l_1_46, vsi = l_1_46, vee = l_1_46}
  l_1_45 = "150.0.7871.182"
  -- DECOMPILER ERROR at PC1459: Overwrote pending register: R41 in 'AssignReg'

  l_1_46 = {cve = l_1_47, vendor = l_1_47, product = l_1_47, vee = l_1_47}
  l_1_46 = "mozilla"
  l_1_46 = "firefox"
  l_1_46 = "153.0"
  -- DECOMPILER ERROR at PC1468: Overwrote pending register: R42 in 'AssignReg'

  l_1_47 = {cve = l_1_48, vendor = l_1_48, product = l_1_48, version = l_1_48}
  l_1_47 = "mozilla"
  l_1_47 = "firefox"
  l_1_47 = "153.0"
  -- DECOMPILER ERROR at PC1477: Overwrote pending register: R43 in 'AssignReg'

  l_1_48 = {cve = l_1_49, vendor = l_1_49, product = l_1_49, vee = l_1_49}
  l_1_48 = "mozilla"
  l_1_48 = "firefox"
  l_1_48 = "153.0"
  -- DECOMPILER ERROR at PC1486: Overwrote pending register: R44 in 'AssignReg'

  l_1_49 = {cve = l_1_50, vendor = l_1_50, product = l_1_50, version = l_1_50}
  l_1_49 = "mozilla"
  l_1_49 = "firefox"
  l_1_49 = "153.0"
  -- DECOMPILER ERROR at PC1495: Overwrote pending register: R45 in 'AssignReg'

  l_1_50 = {cve = l_1_51, vendor = l_1_51, product = l_1_51, vsi = l_1_51, vee = l_1_51}
  l_1_50 = "mozilla"
  l_1_50 = "firefox"
  l_1_50 = "153.0"
  -- DECOMPILER ERROR at PC1504: Overwrote pending register: R46 in 'AssignReg'

  l_1_51 = {cve = l_1_52, vendor = l_1_52, product = l_1_52, vee = l_1_52}
  l_1_51 = "mozilla"
  l_1_51 = "firefox"
  l_1_51 = "153.0"
  -- DECOMPILER ERROR at PC1513: Overwrote pending register: R47 in 'AssignReg'

  l_1_52 = {cve = l_1_53, vendor = l_1_53, product = l_1_53, version = l_1_53}
  l_1_52 = "mozilla"
  l_1_52 = "firefox"
  l_1_52 = "153.0"
  -- DECOMPILER ERROR at PC1522: Overwrote pending register: R48 in 'AssignReg'

  l_1_53 = {cve = l_1_54, vendor = l_1_54, product = l_1_54, vee = l_1_54}
  l_1_53 = "mozilla"
  l_1_53 = "firefox"
  l_1_53 = "153.0"
  -- DECOMPILER ERROR at PC1531: Overwrote pending register: R49 in 'AssignReg'

  l_1_54 = {cve = l_1_55, vendor = l_1_55, product = l_1_55, version = l_1_55}
  l_1_54 = "mozilla"
  l_1_54 = "firefox"
  l_1_54 = "153.0"
  -- DECOMPILER ERROR at PC1540: Overwrote pending register: R50 in 'AssignReg'

  l_1_55 = {cve = l_1_56, vendor = l_1_56, product = l_1_56, vsi = l_1_56, vee = l_1_56}
  l_1_55 = "mozilla"
  l_1_55 = "firefox"
  l_1_55 = "153.0"
  -- DECOMPILER ERROR at PC1549: Overwrote pending register: R51 in 'AssignReg'

  l_1_56 = {cve = l_1_57, vendor = l_1_57, product = l_1_57, vee = l_1_57}
  l_1_56 = "mozilla"
  l_1_56 = "firefox"
  l_1_56 = "153.0"
  -- DECOMPILER ERROR at PC1558: Overwrote pending register: R52 in 'AssignReg'

  l_1_57 = {cve = l_1_58, vendor = l_1_58, product = l_1_58, version = l_1_58}
  l_1_57 = "mozilla"
  l_1_57 = "firefox"
  l_1_57 = "153.0"
  -- DECOMPILER ERROR at PC1567: Overwrote pending register: R53 in 'AssignReg'

  l_1_58 = {
cve = {cve = "CVE-2026-11665", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-49235", vendor = "nlnetlabs", product = "routinator", vee = "0.15.2", cve = "CVE-2026-58184", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
, vendor = "n8n", product = "n8n", vsi = "2.0.0", vee = "2.29.8"}
  l_1_58 = "mozilla"
  l_1_58 = "firefox"
  l_1_58 = "153.0"
  -- DECOMPILER ERROR at PC1576: Overwrote pending register: R54 in 'AssignReg'

  -- DECOMPILER ERROR at PC1585: Overwrote pending register: R55 in 'AssignReg'

  -- DECOMPILER ERROR at PC1594: Overwrote pending register: R56 in 'AssignReg'

  -- DECOMPILER ERROR at PC1603: Overwrote pending register: R57 in 'AssignReg'

  -- DECOMPILER ERROR at PC1612: Overwrote pending register: R58 in 'AssignReg'

  -- DECOMPILER ERROR at PC1629: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC1631: Overwrote pending register: R10 in 'AssignReg'

  l_1_15 = {cve = l_1_16, vendor = l_1_16, product = l_1_16, vee = l_1_16}
  l_1_15 = "mozilla"
  l_1_15 = "firefox"
  l_1_15 = "153.0"
  -- DECOMPILER ERROR at PC1640: Overwrote pending register: R11 in 'AssignReg'

  l_1_16 = {cve = l_1_17, vendor = l_1_17, product = l_1_17, vsi = l_1_17, vee = l_1_17}
  l_1_16 = "mozilla"
  l_1_16 = "firefox_esr"
  l_1_16 = "115.0"
  l_1_16 = "115.38"
  -- DECOMPILER ERROR at PC1651: Overwrote pending register: R12 in 'AssignReg'

  l_1_17 = {cve = l_1_18, vendor = "nlnetlabs", product = l_1_18, vsi = l_1_18, vee = l_1_18}
  l_1_17 = "mozilla"
  l_1_17 = "firefox_esr"
  l_1_17 = "140.0"
  l_1_17 = "140.13"
  -- DECOMPILER ERROR at PC1662: Overwrote pending register: R13 in 'AssignReg'

  l_1_18 = {cve = l_1_19, vendor = l_1_19, product = l_1_19, vsi = "7.0.0", vee = l_1_19}
  l_1_18 = "mozilla"
  l_1_18 = "firefox_esr"
  l_1_18 = "140.0"
  l_1_18 = "140.13"
  -- DECOMPILER ERROR at PC1673: Overwrote pending register: R14 in 'AssignReg'

  l_1_19 = {cve = l_1_20, vendor = l_1_20, product = l_1_20, vsi = "8.0.0", vee = l_1_20}
  l_1_19 = "microsoft"
  l_1_19 = "edge_chromium-based"
  l_1_19 = "104.0.1293.47"
  -- DECOMPILER ERROR at PC1682: Overwrote pending register: R15 in 'AssignReg'

  l_1_20 = {cve = l_1_21, vendor = l_1_21, product = l_1_21, vsi = "7.0.0", vee = l_1_21}
  l_1_20 = "microsoft"
  l_1_20 = "edge_chromium-based"
  l_1_20 = "117.0.2045.31"
  -- DECOMPILER ERROR at PC1691: Overwrote pending register: R16 in 'AssignReg'

  l_1_21 = {cve = l_1_22, vendor = l_1_22, product = l_1_22, vsi = "8.0.0", vee = l_1_22}
  l_1_21 = "microsoft"
  l_1_21 = "edge_chromium-based"
  l_1_21 = "120.0.2210.61"
  -- DECOMPILER ERROR at PC1700: Overwrote pending register: R17 in 'AssignReg'

  l_1_22 = {cve = l_1_23, vendor = l_1_23, product = l_1_23, vee = l_1_23}
  l_1_22 = "microsoft"
  l_1_22 = "edge_chromium-based"
  l_1_22 = "121.0.2277.83"
  -- DECOMPILER ERROR at PC1709: Overwrote pending register: R18 in 'AssignReg'

  l_1_23 = {cve = l_1_24, vendor = l_1_24, product = l_1_24, vsi = l_1_24, vee = l_1_24}
  l_1_23 = "microsoft"
  l_1_23 = "edge_chromium-based"
  l_1_23 = "128.0.2739.42"
  -- DECOMPILER ERROR at PC1718: Overwrote pending register: R19 in 'AssignReg'

  l_1_24 = {cve = l_1_25, vendor = l_1_25, product = l_1_25, vee = l_1_25}
  l_1_24 = "microsoft"
  l_1_24 = "edge_chromium-based"
  l_1_24 = "150.0.4078.48"
  -- DECOMPILER ERROR at PC1727: Overwrote pending register: R20 in 'AssignReg'

  l_1_25 = {cve = l_1_26, vendor = l_1_26, product = l_1_26, vsi = l_1_26, vee = l_1_26}
  l_1_25 = "microsoft"
  l_1_25 = "edge_chromium"
  l_1_25 = "104.0.1293.47"
  -- DECOMPILER ERROR at PC1736: Overwrote pending register: R21 in 'AssignReg'

  l_1_26 = {cve = l_1_27, vendor = l_1_27, product = l_1_27, vee = l_1_27}
  l_1_26 = "microsoft"
  l_1_26 = "edge_chromium"
  l_1_26 = "117.0.2045.31"
  -- DECOMPILER ERROR at PC1745: Overwrote pending register: R22 in 'AssignReg'

  l_1_27 = {cve = l_1_28, vendor = l_1_28, product = l_1_28, vsi = l_1_28, vee = l_1_28}
  l_1_27 = "microsoft"
  l_1_27 = "edge_chromium"
  l_1_27 = "120.0.2210.61"
  -- DECOMPILER ERROR at PC1754: Overwrote pending register: R23 in 'AssignReg'

  l_1_28 = {cve = l_1_29, vendor = l_1_29, product = l_1_29, vsi = "7.0.0", vee = l_1_29}
  l_1_28 = "microsoft"
  l_1_28 = "edge_chromium"
  l_1_28 = "121.0.2277.83"
  -- DECOMPILER ERROR at PC1763: Overwrote pending register: R24 in 'AssignReg'

  l_1_29 = {cve = l_1_30, vendor = l_1_30, product = l_1_30, vsi = l_1_30, vee = l_1_30}
  l_1_29 = "microsoft"
  l_1_29 = "edge_chromium"
  l_1_29 = "150.0.4078.48"
  -- DECOMPILER ERROR at PC1772: Overwrote pending register: R25 in 'AssignReg'

  l_1_30 = {cve = l_1_31, vendor = l_1_31, product = l_1_31, vsi = l_1_31, vee = l_1_31}
  l_1_30 = "microsoft"
  l_1_30 = "edge"
  l_1_30 = "128.0.2739.42"
  -- DECOMPILER ERROR at PC1781: Overwrote pending register: R26 in 'AssignReg'

  l_1_31 = {cve = l_1_32, vendor = l_1_32, product = l_1_32, vsi = l_1_32, vee = l_1_32}
  l_1_31 = "128.0.6613.84"
  -- DECOMPILER ERROR at PC1788: Overwrote pending register: R27 in 'AssignReg'

  l_1_32 = {cve = l_1_33, vendor = l_1_33, product = l_1_33, vsi = l_1_33, vee = l_1_33}
  l_1_32 = "136.0.7103.59"
  -- DECOMPILER ERROR at PC1795: Overwrote pending register: R28 in 'AssignReg'

  l_1_33 = {cve = l_1_34, vendor = "google", product = "chrome", vee = l_1_34}
  l_1_33 = "146.0.7680.164"
  -- DECOMPILER ERROR at PC1804: Overwrote pending register: R29 in 'AssignReg'

  l_1_34 = {cve = l_1_35, vendor = "google", product = "chrome", vee = l_1_35}
  l_1_34 = "cves"
  -- DECOMPILER ERROR at PC1808: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC1809: Overwrote pending register: R32 in 'AssignReg'

  l_1_37, l_1_36 = {cve = l_1_38, vendor = "google", product = "chrome", vee = l_1_38}, {cve = l_1_37, vendor = "google", product = "chrome", vee = l_1_37}
  l_1_35 = {l_1_36, l_1_37; cve = l_1_36, vendor = "google", product = "chrome", vee = l_1_36}
  l_1_35 = "148.0.7778.216"
  l_1_35 = "cves"
  l_1_37 = "CVE-2026-9993"
  -- DECOMPILER ERROR at PC1820: Overwrote pending register: R33 in 'AssignReg'

  l_1_38 = {cve = l_1_39, vendor = "google", product = "chrome", vee = l_1_39}
  l_1_36 = {l_1_37, l_1_38}
  l_1_36 = "149.0.7827.53"
  l_1_36 = "cves"
  l_1_38 = "CVE-2026-11009"
  -- DECOMPILER ERROR at PC1831: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC1832: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC1833: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC1834: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC1835: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC1836: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC1837: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC1838: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC1839: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC1840: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC1841: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC1842: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC1843: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC1844: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC1845: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC1846: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC1847: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC1848: Overwrote pending register: R51 in 'AssignReg'

  l_1_56, l_1_55, l_1_54, l_1_53, l_1_52, l_1_51, l_1_50, l_1_49, l_1_48, l_1_47, l_1_46, l_1_45, l_1_44, l_1_43, l_1_42, l_1_41, l_1_40, l_1_39 = {cve = l_1_57, vendor = l_1_57, product = l_1_57, vee = l_1_57}, {cve = l_1_56, vendor = l_1_56, product = l_1_56, vee = l_1_56}, {cve = l_1_55, vendor = l_1_55, product = l_1_55, vee = l_1_55}, {cve = l_1_54, vendor = l_1_54, product = l_1_54, vee = l_1_54}, {cve = l_1_53, vendor = l_1_53, product = l_1_53, vee = l_1_53}, {cve = l_1_52, vendor = l_1_52, product = l_1_52, vee = l_1_52}, {cve = l_1_51, vendor = l_1_51, product = l_1_51, vee = l_1_51}, {cve = l_1_50, vendor = l_1_50, product = l_1_50, vee = l_1_50}, {cve = l_1_49, vendor = l_1_49, product = l_1_49, vee = l_1_49}, {cve = l_1_48, vendor = l_1_48, product = l_1_48, vee = l_1_48}, {cve = l_1_47, vendor = l_1_47, product = l_1_47, vee = l_1_47}, {cve = l_1_46, vendor = l_1_46, product = l_1_46, vee = l_1_46}, {cve = l_1_45, vendor = "google", product = "chrome", vee = l_1_45}, {cve = l_1_44, vendor = "google", product = "chrome", vee = l_1_44}, {cve = l_1_43, vendor = "google", product = "chrome", vee = l_1_43}, {cve = l_1_42, vendor = "google", product = "chrome", vee = l_1_42}, {cve = l_1_41, vendor = "google", product = "chrome", vee = l_1_41}, {cve = l_1_40, vendor = "google", product = "chrome", vee = l_1_40}
  l_1_37 = {l_1_38, l_1_39, l_1_40, l_1_41, l_1_42, l_1_43, l_1_44, l_1_45, l_1_46, l_1_47, l_1_48, l_1_49, l_1_50, l_1_51, l_1_52, l_1_53, l_1_54, l_1_55, l_1_56}
  l_1_37 = "CVE-2026-12440"
  l_1_37 = "149.0.7827.155"
  l_1_38 = "150.0.7871.46"
  l_1_38 = "cves"
  l_1_40 = "CVE-2026-13853"
  l_1_41 = "CVE-2026-13859"
  l_1_42 = "CVE-2026-13861"
  l_1_43 = "CVE-2026-13883"
  l_1_44 = "CVE-2026-14093"
  l_1_45 = "CVE-2026-14095"
  l_1_46 = "CVE-2026-14387"
  l_1_47 = "CVE-2026-14390"
  l_1_48 = "CVE-2026-14392"
  l_1_49 = "CVE-2026-14398"
  l_1_50 = "CVE-2026-14405"
  l_1_51 = "CVE-2026-14411"
  l_1_52 = "CVE-2026-14416"
  l_1_53 = "CVE-2026-14417"
  l_1_54 = "CVE-2026-14419"
  l_1_55 = "CVE-2026-14420"
  l_1_56 = "CVE-2026-14423"
  -- DECOMPILER ERROR at PC1882: Overwrote pending register: R52 in 'AssignReg'

  l_1_57 = {cve = l_1_58, vendor = l_1_58, product = l_1_58, vee = l_1_58}
  l_1_39 = {l_1_40, l_1_41, l_1_42, l_1_43, l_1_44, l_1_45, l_1_46, l_1_47, l_1_48, l_1_49, l_1_50, l_1_51, l_1_52, l_1_53, l_1_54, l_1_55, l_1_56, l_1_57}
  l_1_39 = "150.0.7871.47"
  l_1_39 = "cves"
  l_1_41 = "CVE-2026-13789"
  l_1_42 = "CVE-2026-13869"
  l_1_43 = "CVE-2026-13901"
  l_1_44 = "CVE-2026-13909"
  l_1_45 = "CVE-2026-13920"
  l_1_46 = "CVE-2026-14017"
  l_1_47 = "CVE-2026-14037"
  l_1_48 = "CVE-2026-14038"
  l_1_49 = "CVE-2026-14043"
  l_1_50 = "CVE-2026-14044"
  l_1_51 = "CVE-2026-14055"
  l_1_52 = "CVE-2026-14056"
  l_1_53 = "CVE-2026-14097"
  l_1_54 = "CVE-2026-14104"
  l_1_55 = "CVE-2026-14106"
  l_1_56 = "CVE-2026-14109"
  l_1_57 = "CVE-2026-14113"
  -- DECOMPILER ERROR at PC1909: Overwrote pending register: R53 in 'AssignReg'

  -- DECOMPILER ERROR at PC1910: Overwrote pending register: R54 in 'AssignReg'

  l_1_58 = {
cve = {
cve = {cve = "CVE-2026-11666", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-49975", vendor = "apache", product = "http_server", vsi = "2.4.17", vee = "2.4.68", cve = "CVE-2026-58184", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
, vendor = "netty", product = "netty", vsi = "4.1.0", vee = "4.1.136"}
, vendor = "mozilla", product = "firefox", vee = "153.0"}
  l_1_40 = {l_1_41, l_1_42, l_1_43, l_1_44, l_1_45, l_1_46, l_1_47, l_1_48, l_1_49, l_1_50, l_1_51, l_1_52, l_1_53, l_1_54, l_1_55, l_1_56, l_1_57, l_1_58, 
{
cve = {
cve = {cve = "CVE-2026-11667", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-49975", vendor = "f5", product = "nginx", vee = "1.29.8", cve = "CVE-2026-58185", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4"}
, vendor = "netty", product = "netty", vsi = "4.2.0", vee = "4.2.16"}
, vendor = "mozilla", product = "firefox", vee = "153.0"}
}
  l_1_40 = "CVE-2026-15773"
  l_1_40 = "150.0.7871.125"
  l_1_41 = "CVE-2026-15901"
  l_1_41 = "150.0.7871.128"
  l_1_42 = "151.0.7922.72"
  l_1_42 = "cves"
  l_1_44 = "CVE-2026-17666"
  l_1_45 = "CVE-2026-17670"
  l_1_46 = "CVE-2026-17673"
  l_1_47 = "CVE-2026-17675"
  l_1_48 = "CVE-2026-17680"
  l_1_49 = "CVE-2026-17681"
  l_1_50 = "CVE-2026-17682"
  l_1_51 = "CVE-2026-17687"
  l_1_52 = "CVE-2026-17691"
  l_1_53 = "CVE-2026-17692"
  l_1_54 = "CVE-2026-17697"
  l_1_55 = "CVE-2026-17704"
  l_1_56 = "CVE-2026-17726"
  l_1_57 = "CVE-2026-17727"
  l_1_58 = "CVE-2026-17758"
  -- DECOMPILER ERROR at PC1950: Overwrote pending register: R55 in 'AssignReg'

  -- DECOMPILER ERROR at PC1951: Overwrote pending register: R56 in 'AssignReg'

  -- DECOMPILER ERROR at PC1952: Overwrote pending register: R57 in 'AssignReg'

  -- DECOMPILER ERROR at PC1953: Overwrote pending register: R58 in 'AssignReg'

  l_1_43 = {l_1_44, l_1_45, l_1_46, l_1_47, l_1_48, l_1_49, l_1_50, l_1_51, l_1_52, l_1_53, l_1_54, l_1_55, l_1_56, l_1_57, l_1_58, "CVE-2026-17768", 
{
cve = {
cve = {cve = "CVE-2026-11668", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-14266", vendor = "igor_pavlov", product = "", vee = "26.02", cve = "CVE-2026-58185", vendor = "apache", product = "traffic_server", vsi = "8.0.0", vei = "8.1.9"}
, vendor = "netty", product = "netty", vsi = "4.1.0", vee = "4.1.136"}
, vendor = "mozilla", product = "firefox", vee = "153.0"}
, 
{
cve = {
cve = {cve = "CVE-2026-11669", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-14191", vendor = "rarlab", product = "winrar", vee = "7.23", cve = "CVE-2026-58185", vendor = "apache", product = "traffic_server", vsi = "9.0.0", vee = "9.2.15"}
, vendor = "netty", product = "netty", vsi = "4.2.0", vee = "4.2.16"}
, vendor = "mozilla", product = "firefox", vee = "153.0"}
, 
{
cve = {cve = "CVE-2026-56817", vendor = "netty", product = "netty", vsi = "4.1.0", vee = "4.1.136"}
, vendor = "mozilla", product = "firefox", vee = "153.0"}
, 
{cve = "CVE-2026-16411", vendor = "mozilla", product = "firefox", vee = "153.0"}
, "CVE-2026-17837", "CVE-2026-17847", "CVE-2026-17865", "CVE-2026-17924", "CVE-2026-17940", "CVE-2026-17947", "CVE-2026-17987", "CVE-2026-17990", "CVE-2026-17991", "CVE-2026-18002"}
  l_1_43 = "acrobat"
  l_1_43 = "3.0"
  l_1_43 = "3.1"
  l_1_43 = "cves"
  l_1_45 = "CVE-2009-3954"
  l_1_46 = "CVE-2009-3955"
  l_1_47 = "CVE-2009-3958"
  l_1_48 = "CVE-2009-3959"
  l_1_49 = "CVE-2010-2884"
  l_1_44 = {l_1_45, l_1_46, l_1_47, l_1_48, l_1_49}
  l_1_44 = "acrobat"
  l_1_44 = "4.0"
  l_1_44 = "4.0.5c"
  l_1_44 = "cves"
  l_1_46 = "CVE-2009-3954"
  l_1_47 = "CVE-2009-3955"
  l_1_48 = "CVE-2009-3958"
  l_1_49 = "CVE-2009-3959"
  l_1_50 = "CVE-2010-2884"
  l_1_45 = {l_1_46, l_1_47, l_1_48, l_1_49, l_1_50}
  l_1_45 = "acrobat"
  l_1_45 = "5.0"
  l_1_45 = "5.0.10"
  l_1_45 = "cves"
  l_1_47 = "CVE-2009-3954"
  l_1_48 = "CVE-2009-3955"
  l_1_49 = "CVE-2009-3958"
  l_1_50 = "CVE-2009-3959"
  l_1_51 = "CVE-2010-2884"
  l_1_46 = {l_1_47, l_1_48, l_1_49, l_1_50, l_1_51}
  l_1_46 = "acrobat"
  l_1_46 = "6.0"
  l_1_46 = "6.0.6"
  l_1_46 = "cves"
  l_1_48 = "CVE-2009-3954"
  l_1_49 = "CVE-2009-3955"
  l_1_50 = "CVE-2009-3958"
  l_1_51 = "CVE-2009-3959"
  l_1_52 = "CVE-2010-2884"
  l_1_47 = {l_1_48, l_1_49, l_1_50, l_1_51, l_1_52}
  l_1_47 = "acrobat"
  l_1_47 = "7.0"
  l_1_47 = "7.1.4"
  l_1_47 = "cves"
  l_1_49 = "CVE-2009-3954"
  l_1_50 = "CVE-2009-3955"
  l_1_51 = "CVE-2009-3958"
  l_1_52 = "CVE-2009-3959"
  l_1_53 = "CVE-2010-2884"
  l_1_48 = {l_1_49, l_1_50, l_1_51, l_1_52, l_1_53}
  l_1_48 = "CVE-2009-3953"
  l_1_48 = "acrobat"
  l_1_48 = "7.0"
  l_1_48 = "7.1.4"
  l_1_49 = "acrobat"
  l_1_49 = "8.0"
  l_1_49 = "8.1.7"
  l_1_49 = "cves"
  l_1_51 = "CVE-2009-3954"
  l_1_52 = "CVE-2009-3955"
  l_1_53 = "CVE-2009-3958"
  l_1_54 = "CVE-2009-3959"
  l_1_50 = {l_1_51, l_1_52, l_1_53, l_1_54}
  l_1_50 = "CVE-2009-3953"
  l_1_50 = "acrobat"
  l_1_50 = "8.0"
  l_1_50 = "8.2"
  l_1_51 = "acrobat"
  l_1_51 = "8.0"
  l_1_51 = "8.2.1"
  l_1_51 = "cves"
  l_1_53 = "CVE-2010-0191"
  l_1_54 = "CVE-2010-0192"
  l_1_55 = "CVE-2010-0193"
  l_1_56 = "CVE-2010-0195"
  l_1_57 = "CVE-2010-0196"
  l_1_58 = "CVE-2010-0198"
  l_1_52 = {l_1_53, l_1_54, l_1_55, l_1_56, l_1_57, l_1_58, "CVE-2010-0199", "CVE-2010-0202", "CVE-2010-0203", "CVE-2010-0204"}
  l_1_52 = "CVE-2010-0188"
  l_1_52 = "acrobat"
  l_1_52 = "8.0"
  l_1_52 = "8.2.1"
  l_1_53 = "acrobat"
  l_1_53 = "8.0"
  l_1_53 = "8.2.2"
  l_1_53 = "cves"
  l_1_55 = "CVE-2010-2168"
  l_1_56 = "CVE-2010-2201"
  l_1_57 = "CVE-2010-2204"
  l_1_58 = "CVE-2010-2206"
  l_1_54 = {l_1_55, l_1_56, l_1_57, l_1_58}
  l_1_54 = "CVE-2010-2884"
  l_1_54 = "acrobat"
  l_1_54 = "8.0"
  l_1_54 = "8.2.3"
  l_1_55 = "CVE-2010-2883"
  l_1_55 = "acrobat"
  l_1_55 = "8.0"
  l_1_55 = "8.2.5"
  l_1_56 = "acrobat"
  l_1_56 = "9.0"
  l_1_56 = "9.1.3"
  l_1_56 = "cves"
  l_1_58 = "CVE-2009-3954"
  l_1_57 = {l_1_58, "CVE-2009-3955", "CVE-2009-3958", "CVE-2009-3959"}
  l_1_57 = "CVE-2009-3953"
  l_1_57 = "acrobat"
  l_1_57 = "9.0"
  l_1_57 = "9.3"
  l_1_58 = "CVE-2010-0188"
  l_1_58 = "acrobat"
  l_1_58 = "9.0"
  l_1_58 = "9.3.1"
  local l_1_59 = {vendor = "adobe", product = "acrobat", vsi = "9.0", vei = "9.3.2", 
cves = {"CVE-2010-2168", "CVE-2010-2201", "CVE-2010-2204", "CVE-2010-2206"}
}
  do
    local l_1_60 = {cve = "CVE-2010-2884", vendor = "adobe", product = "acrobat", vsi = "9.0", vei = "9.3.3"}
    -- DECOMPILER ERROR at PC2273: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC2275: Overwrote pending register: R10 in 'AssignReg'

    l_1_15 = {cve = l_1_16, vendor = l_1_16, product = l_1_16, vsi = l_1_16, vee = l_1_16}
    l_1_15 = "acrobat"
    l_1_15 = "9.0"
    l_1_15 = "9.5.5"
    -- DECOMPILER ERROR at PC2286: Overwrote pending register: R11 in 'AssignReg'

    l_1_16 = {cve = l_1_17, vendor = l_1_17, product = l_1_17, vsi = l_1_17, vee = l_1_17}
    l_1_16 = "9.2"
    l_1_16 = "cves"
    -- DECOMPILER ERROR at PC2292: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC2293: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC2294: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC2295: Overwrote pending register: R16 in 'AssignReg'

    l_1_21, l_1_20, l_1_19, l_1_18 = {cve = l_1_22, vendor = l_1_22, product = l_1_22, vee = l_1_22}, {cve = l_1_21, vendor = l_1_21, product = l_1_21, vee = l_1_21}, {cve = l_1_20, vendor = l_1_20, product = l_1_20, vee = l_1_20}, {cve = l_1_19, vendor = l_1_19, product = l_1_19, vee = l_1_19}
    l_1_17 = {l_1_18, l_1_19, l_1_20, l_1_21; cve = l_1_18, vendor = l_1_18, product = l_1_18, vsi = l_1_18, vee = l_1_18}
    l_1_17 = "CVE-2010-2884"
    l_1_17 = "acrobat"
    l_1_17 = "9.3.4"
    l_1_18 = "acrobat"
    l_1_18 = "9.4.5"
    l_1_18 = "cves"
    l_1_20 = "CVE-2011-4370"
    l_1_21 = "CVE-2011-4371"
    -- DECOMPILER ERROR at PC2316: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC2317: Overwrote pending register: R18 in 'AssignReg'

    l_1_23, l_1_22 = {cve = l_1_24, vendor = l_1_24, product = l_1_24, vee = l_1_24}, {cve = l_1_23, vendor = l_1_23, product = l_1_23, vee = l_1_23}
    l_1_19 = {l_1_20, l_1_21, l_1_22, l_1_23}
    l_1_19 = "acrobat"
    l_1_19 = "9.4.6"
    l_1_19 = "cves"
    l_1_21 = "CVE-2011-4370"
    l_1_22 = "CVE-2011-4371"
    l_1_23 = "CVE-2011-4372"
    -- DECOMPILER ERROR at PC2331: Overwrote pending register: R19 in 'AssignReg'

    l_1_24 = {cve = l_1_25, vendor = l_1_25, product = l_1_25, vee = l_1_25}
    l_1_20 = {l_1_21, l_1_22, l_1_23, l_1_24}
    l_1_20 = "acrobat"
    l_1_20 = "9.4.6"
    l_1_20 = "9.4.7"
    l_1_20 = "cves"
    l_1_22 = "CVE-2011-4370"
    l_1_23 = "CVE-2011-4371"
    l_1_24 = "CVE-2011-4372"
    -- DECOMPILER ERROR at PC2347: Overwrote pending register: R20 in 'AssignReg'

    l_1_25 = {cve = l_1_26, vendor = l_1_26, product = l_1_26, vee = l_1_26}
    l_1_21 = {l_1_22, l_1_23, l_1_24, l_1_25}
    l_1_21 = "acrobat"
    l_1_21 = "9"
    l_1_21 = "9.5.1"
    l_1_21 = "cves"
    l_1_23 = "CVE-2012-1525"
    l_1_24 = "CVE-2012-2049"
    l_1_25 = "CVE-2012-2050"
    -- DECOMPILER ERROR at PC2363: Overwrote pending register: R21 in 'AssignReg'

    -- DECOMPILER ERROR at PC2364: Overwrote pending register: R22 in 'AssignReg'

    -- DECOMPILER ERROR at PC2365: Overwrote pending register: R23 in 'AssignReg'

    -- DECOMPILER ERROR at PC2366: Overwrote pending register: R24 in 'AssignReg'

    -- DECOMPILER ERROR at PC2367: Overwrote pending register: R25 in 'AssignReg'

    -- DECOMPILER ERROR at PC2368: Overwrote pending register: R26 in 'AssignReg'

    -- DECOMPILER ERROR at PC2369: Overwrote pending register: R27 in 'AssignReg'

    -- DECOMPILER ERROR at PC2370: Overwrote pending register: R28 in 'AssignReg'

    -- DECOMPILER ERROR at PC2371: Overwrote pending register: R29 in 'AssignReg'

    -- DECOMPILER ERROR at PC2372: Overwrote pending register: R30 in 'AssignReg'

    -- DECOMPILER ERROR at PC2373: Overwrote pending register: R31 in 'AssignReg'

    -- DECOMPILER ERROR at PC2374: Overwrote pending register: R32 in 'AssignReg'

    -- DECOMPILER ERROR at PC2375: Overwrote pending register: R33 in 'AssignReg'

    -- DECOMPILER ERROR at PC2376: Overwrote pending register: R34 in 'AssignReg'

    -- DECOMPILER ERROR at PC2377: Overwrote pending register: R35 in 'AssignReg'

    l_1_40, l_1_39, l_1_38, l_1_37, l_1_36, l_1_35, l_1_34, l_1_33, l_1_32, l_1_31, l_1_30, l_1_29, l_1_28, l_1_27, l_1_26 = {cve = l_1_41, vendor = "google", product = "chrome", vee = l_1_41}, {cve = l_1_40, vendor = "google", product = "chrome", vee = l_1_40}, {vendor = "google", product = "chrome", vee = l_1_39, [l_1_39] = l_1_40}, {vendor = "google", product = "chrome", vee = l_1_38, [l_1_38] = l_1_39}, {cve = l_1_37, vendor = "google", product = "chrome", vee = l_1_37}, {vendor = "google", product = "chrome", vee = l_1_36, [l_1_36] = l_1_37}, {vendor = "google", product = "chrome", vee = l_1_35, [l_1_35] = l_1_36}, {vendor = "google", product = "chrome", vee = l_1_34, [l_1_34] = l_1_35}, {cve = l_1_33, vendor = "google", product = "chrome", vee = l_1_33}, {cve = l_1_32, vendor = "google", product = "chrome", vee = l_1_32}, {cve = l_1_31, vendor = "google", product = "chrome", vee = l_1_31}, {cve = l_1_30, vendor = l_1_30, product = l_1_30, vee = l_1_30}, {cve = l_1_29, vendor = l_1_29, product = l_1_29, vee = l_1_29}, {cve = l_1_28, vendor = l_1_28, product = l_1_28, vee = l_1_28}, {cve = l_1_27, vendor = l_1_27, product = l_1_27, vee = l_1_27}
    l_1_22 = {l_1_23, l_1_24, l_1_25, l_1_26, l_1_27, l_1_28, l_1_29, l_1_30, l_1_31, l_1_32, l_1_33, l_1_34, l_1_35, l_1_36, l_1_37, l_1_38, l_1_39, l_1_40}
    l_1_22 = "CVE-2011-4369"
    l_1_22 = "acrobat"
    l_1_22 = "10.0"
    l_1_22 = "10.1.1"
    l_1_23 = "acrobat"
    l_1_23 = "10.0"
    l_1_23 = "10.1.3"
    l_1_23 = "cves"
    l_1_25 = "CVE-2012-1525"
    l_1_26 = "CVE-2012-2049"
    l_1_27 = "CVE-2012-2050"
    l_1_28 = "CVE-2012-2051"
    l_1_29 = "CVE-2012-4147"
    l_1_30 = "CVE-2012-4148"
    l_1_31 = "CVE-2012-4149"
    l_1_32 = "CVE-2012-4150"
    l_1_33 = "CVE-2012-4151"
    l_1_34 = "CVE-2012-4152"
    l_1_35 = "CVE-2012-4153"
    l_1_36 = "CVE-2012-4154"
    l_1_37 = "CVE-2012-4155"
    l_1_38 = "CVE-2012-4156"
    l_1_39 = "CVE-2012-4157"
    l_1_40 = "CVE-2012-4158"
    -- DECOMPILER ERROR at PC2416: Overwrote pending register: R36 in 'AssignReg'

    -- DECOMPILER ERROR at PC2417: Overwrote pending register: R37 in 'AssignReg'

    l_1_42, l_1_41 = {vendor = "adobe", product = l_1_43, vsi = l_1_43, vei = l_1_43, [l_1_43] = l_1_44}, {vendor = "google", product = "chrome", vee = l_1_42, [l_1_42] = l_1_43}
    l_1_24 = {l_1_25, l_1_26, l_1_27, l_1_28, l_1_29, l_1_30, l_1_31, l_1_32, l_1_33, l_1_34, l_1_35, l_1_36, l_1_37, l_1_38, l_1_39, l_1_40, l_1_41, l_1_42}
    l_1_24 = "acrobat"
    l_1_24 = "10.0"
    l_1_24 = "10.1.6"
    l_1_24 = "cves"
    l_1_26 = "CVE-2013-0640"
    l_1_27 = "CVE-2013-0641"
    l_1_25 = {l_1_26, l_1_27}
    l_1_25 = "CVE-2013-3346"
    l_1_25 = "acrobat"
    l_1_25 = "10.0"
    l_1_25 = "10.1.7"
    l_1_26 = "acrobat"
    l_1_26 = "10.0"
    l_1_26 = "10.1.7"
    l_1_26 = "cves"
    l_1_28 = "CVE-2013-3352"
    l_1_29 = "CVE-2013-3354"
    l_1_30 = "CVE-2013-3355"
    l_1_31 = "CVE-2013-3356"
    l_1_32 = "CVE-2013-3357"
    l_1_33 = "CVE-2013-3358"
    l_1_27 = {l_1_28, l_1_29, l_1_30, l_1_31, l_1_32, l_1_33}
    l_1_27 = "acrobat"
    l_1_27 = "10.0"
    l_1_27 = "10.1.9"
    l_1_27 = "cves"
    l_1_29 = "CVE-2014-0523"
    l_1_30 = "CVE-2014-0524"
    l_1_31 = "CVE-2014-0526"
    l_1_32 = "CVE-2014-0527"
    l_1_33 = "CVE-2014-0529"
    l_1_28 = {l_1_29, l_1_30, l_1_31, l_1_32, l_1_33}
    l_1_28 = "acrobat"
    l_1_28 = "10.0"
    l_1_28 = "10.1.9"
    l_1_28 = "cves"
    l_1_30 = "CVE-2014-0493"
    l_1_31 = "CVE-2014-0495"
    l_1_32 = "CVE-2014-0496"
    l_1_29 = {l_1_30, l_1_31, l_1_32}
    l_1_29 = "CVE-2014-0546"
    l_1_29 = "acrobat"
    l_1_29 = "10.0"
    l_1_29 = "10.1.11"
    l_1_30 = "acrobat"
    l_1_30 = "10.0"
    l_1_30 = "10.1.11"
    l_1_30 = "cves"
    l_1_32 = "CVE-2014-0563"
    l_1_33 = "CVE-2014-0565"
    l_1_34 = "CVE-2014-0567"
    l_1_31 = {l_1_32, l_1_33, l_1_34}
    l_1_31 = "acrobat"
    l_1_31 = "10.0"
    l_1_31 = "10.1.15"
    l_1_31 = "cves"
    l_1_33 = "CVE-2014-0566"
    l_1_34 = "CVE-2015-5102"
    l_1_32 = {l_1_33, l_1_34}
    l_1_32 = "CVE-2015-5583"
    l_1_32 = "acrobat"
    l_1_32 = "10.0"
    l_1_32 = "10.1.15"
    l_1_33 = "acrobat"
    l_1_33 = "10.1.1"
    l_1_33 = "cves"
    l_1_35 = "CVE-2011-2462"
    l_1_36 = "CVE-2011-4370"
    l_1_37 = "CVE-2011-4371"
    l_1_38 = "CVE-2011-4372"
    l_1_39 = "CVE-2011-4373"
    l_1_34 = {l_1_35, l_1_36, l_1_37, l_1_38, l_1_39}
    l_1_34 = "CVE-2015-5583"
    l_1_34 = "acrobat"
    l_1_34 = "11.0.0"
    l_1_34 = "11.0.12"
    l_1_35 = "acrobat"
    l_1_35 = "11.0.0"
    l_1_35 = "11.0.12"
    l_1_35 = "cves"
    l_1_37 = "CVE-2014-0566"
    l_1_38 = "CVE-2015-5102"
    l_1_36 = {l_1_37, l_1_38}
    l_1_36 = "CVE-2017-3010"
    l_1_36 = "acrobat"
    l_1_36 = "11.0.0"
    l_1_36 = "11.0.18"
    l_1_37 = "acrobat"
    l_1_37 = "11.0"
    l_1_37 = "11.0.02"
    l_1_37 = "cves"
    l_1_39 = "CVE-2013-0640"
    l_1_40 = "CVE-2013-0641"
    l_1_38 = {l_1_39, l_1_40}
    l_1_38 = "acrobat"
    l_1_38 = "11.0"
    l_1_38 = "11.0.3"
    l_1_38 = "cves"
    l_1_40 = "CVE-2013-3352"
    l_1_41 = "CVE-2013-3354"
    l_1_42 = "CVE-2013-3355"
    -- DECOMPILER ERROR at PC2619: Overwrote pending register: R38 in 'AssignReg'

    -- DECOMPILER ERROR at PC2620: Overwrote pending register: R39 in 'AssignReg'

    -- DECOMPILER ERROR at PC2621: Overwrote pending register: R40 in 'AssignReg'

    l_1_45, l_1_44, l_1_43 = {vendor = "adobe", product = l_1_46, vsi = l_1_46, vei = l_1_46, [l_1_46] = l_1_47}, {vendor = "adobe", product = l_1_45, vsi = l_1_45, vei = l_1_45, [l_1_45] = l_1_46}, {vendor = "adobe", product = l_1_44, vsi = l_1_44, vei = l_1_44, [l_1_44] = l_1_45}
    l_1_39 = {l_1_40, l_1_41, l_1_42, l_1_43, l_1_44, l_1_45}
    l_1_39 = "CVE-2013-3346"
    l_1_39 = "acrobat"
    l_1_39 = "11.0"
    l_1_39 = "11.0.03"
    l_1_40 = "acrobat"
    l_1_40 = "11.0"
    l_1_40 = "11.0.6"
    l_1_40 = "cves"
    l_1_42 = "CVE-2014-0493"
    l_1_43 = "CVE-2014-0495"
    l_1_44 = "CVE-2014-0496"
    l_1_41 = {l_1_42, l_1_43, l_1_44}
    l_1_41 = "acrobat"
    l_1_41 = "11.0"
    l_1_41 = "11.0.6"
    l_1_41 = "cves"
    l_1_43 = "CVE-2014-0523"
    l_1_44 = "CVE-2014-0524"
    l_1_45 = "CVE-2014-0526"
    -- DECOMPILER ERROR at PC2662: Overwrote pending register: R41 in 'AssignReg'

    -- DECOMPILER ERROR at PC2663: Overwrote pending register: R42 in 'AssignReg'

    l_1_47, l_1_46 = {cve = l_1_48, vendor = "adobe", product = l_1_48, vsi = l_1_48, vee = l_1_48}, {vendor = "adobe", product = l_1_47, vsi = l_1_47, vei = l_1_47, [l_1_47] = l_1_48}
    l_1_42 = {l_1_43, l_1_44, l_1_45, l_1_46, l_1_47}
    l_1_42 = "CVE-2014-0546"
    l_1_42 = "acrobat"
    l_1_42 = "11.0"
    l_1_42 = "11.0.08"
    l_1_43 = "acrobat"
    l_1_43 = "11.0"
    l_1_43 = "11.0.8"
    l_1_43 = "cves"
    l_1_45 = "CVE-2014-0563"
    l_1_46 = "CVE-2014-0565"
    l_1_47 = "CVE-2014-0567"
    l_1_44 = {l_1_45, l_1_46, l_1_47}
    l_1_44 = "acrobat"
    l_1_44 = "11.0.17"
    l_1_44 = "cves"
    l_1_46 = "CVE-2016-6969"
    l_1_47 = "CVE-2016-6971"
    l_1_45 = {l_1_46, l_1_47}
    l_1_45 = "CVE-2012-4363"
    l_1_45 = "acrobat_reader"
    l_1_45 = "3.0"
    l_1_45 = "3.02"
    l_1_46 = "CVE-2012-4363"
    l_1_46 = "acrobat_reader"
    l_1_46 = "4.0"
    l_1_46 = "4.5"
    l_1_47 = "CVE-2012-4363"
    l_1_47 = "acrobat_reader"
    l_1_47 = "5.0"
    l_1_47 = "5.1"
    -- DECOMPILER ERROR at PC2734: Overwrote pending register: R43 in 'AssignReg'

    l_1_48 = {vendor = "adobe", product = l_1_49, vsi = l_1_49, vei = l_1_49, [l_1_49] = l_1_50}
    l_1_48 = "acrobat_reader"
    l_1_48 = "6.0"
    l_1_48 = "6.0.5"
    -- DECOMPILER ERROR at PC2744: Overwrote pending register: R44 in 'AssignReg'

    l_1_49 = {cve = l_1_50, vendor = "adobe", product = l_1_50, vsi = l_1_50, vee = l_1_50}
    l_1_49 = "acrobat_reader"
    l_1_49 = "7.0"
    l_1_49 = "7.1.0"
    -- DECOMPILER ERROR at PC2755: Overwrote pending register: R45 in 'AssignReg'

    l_1_50 = {vendor = "adobe", product = l_1_51, vsi = l_1_51, vei = l_1_51, [l_1_51] = l_1_52}
    l_1_50 = "8.0"
    l_1_50 = "cves"
    -- DECOMPILER ERROR at PC2761: Overwrote pending register: R47 in 'AssignReg'

    -- DECOMPILER ERROR at PC2762: Overwrote pending register: R48 in 'AssignReg'

    -- DECOMPILER ERROR at PC2763: Overwrote pending register: R49 in 'AssignReg'

    -- DECOMPILER ERROR at PC2764: Overwrote pending register: R50 in 'AssignReg'

    -- DECOMPILER ERROR at PC2765: Overwrote pending register: R51 in 'AssignReg'

    -- DECOMPILER ERROR at PC2766: Overwrote pending register: R52 in 'AssignReg'

    -- DECOMPILER ERROR at PC2767: Overwrote pending register: R53 in 'AssignReg'

    l_1_59 = "CVE-2011-0591"
    l_1_60 = "CVE-2011-0592"
    -- DECOMPILER ERROR at PC2770: Overwrote pending register: R56 in 'AssignReg'

    -- DECOMPILER ERROR at PC2771: Overwrote pending register: R57 in 'AssignReg'

    -- DECOMPILER ERROR at PC2772: Overwrote pending register: R58 in 'AssignReg'

    l_1_58, l_1_57, l_1_56, l_1_55, l_1_54, l_1_53, l_1_52 = {vendor = "adobe", product = "acrobat", vsi = "9.0", vei = "9.3.1", 
cves = {"CVE-2010-0191", "CVE-2010-0192", "CVE-2010-0193", "CVE-2010-0195", "CVE-2010-0196", "CVE-2010-0198", "CVE-2010-0199", "CVE-2010-0202", "CVE-2010-0203", "CVE-2010-0204"}
}, {cve = l_1_58, vendor = "adobe", product = l_1_58, vsi = l_1_58, vee = l_1_58}, {cve = l_1_57, vendor = "adobe", product = l_1_57, vsi = l_1_57, vee = l_1_57}, {vendor = "adobe", product = l_1_56, vsi = l_1_56, vei = l_1_56, [l_1_56] = l_1_57}, {cve = l_1_55, vendor = "adobe", product = l_1_55, vsi = l_1_55, vee = l_1_55}, {cve = l_1_54, vendor = "adobe", product = l_1_54, vsi = l_1_54, vei = l_1_54}, {vendor = "adobe", product = l_1_53, vsi = l_1_53, vei = l_1_53, [l_1_53] = l_1_54}
    l_1_51 = {l_1_52, l_1_53, l_1_54, l_1_55, l_1_56, l_1_57, l_1_58, l_1_59, l_1_60, 
{cve = "CVE-2010-2883", vendor = "adobe", product = "acrobat", vsi = "9.0", vee = "9.4"}
, 
{cve = "CVE-2011-4369", vendor = "adobe", product = "acrobat", vsi = "9.0", vei = "9.4.6"}
, 
{vendor = "adobe", product = "acrobat", vsi = "9.0", vee = "9.5.4", 
cves = {"CVE-2013-0640", "CVE-2013-0641"}
}
, "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"; cve = l_1_52, vendor = "adobe", product = l_1_52, vsi = l_1_52, vee = l_1_52}
    l_1_51 = "acrobat_reader"
    l_1_51 = "8.0"
    l_1_51 = "8.2.6"
    l_1_51 = "cves"
    l_1_53 = "CVE-2011-2094"
    l_1_54 = "CVE-2011-2095"
    l_1_55 = "CVE-2011-2096"
    l_1_56 = "CVE-2011-2097"
    l_1_57 = "CVE-2011-2098"
    l_1_58 = "CVE-2011-2099"
    l_1_59 = "CVE-2011-2101"
    l_1_60 = "CVE-2011-2103"
    l_1_52 = {l_1_53, l_1_54, l_1_55, l_1_56, l_1_57, l_1_58, l_1_59, l_1_60}
    l_1_52 = "CVE-2012-4363"
    l_1_52 = "acrobat_reader"
    l_1_52 = "8.0"
    l_1_52 = "8.3"
    l_1_53 = "acrobat_reader"
    l_1_53 = "8.1"
    l_1_53 = "cves"
    l_1_55 = "CVE-2010-1241"
    l_1_56 = "CVE-2010-4091"
    l_1_57 = "CVE-2011-0566"
    l_1_58 = "CVE-2011-0567"
    l_1_59 = "CVE-2011-0586"
    l_1_60 = "CVE-2011-0589"
    l_1_54 = {l_1_55, l_1_56, l_1_57, l_1_58, l_1_59, l_1_60, "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
    l_1_54 = "acrobat_reader"
    l_1_54 = "8.1.1"
    l_1_54 = "cves"
    l_1_56 = "CVE-2010-1241"
    l_1_57 = "CVE-2010-4091"
    l_1_58 = "CVE-2011-0566"
    l_1_59 = "CVE-2011-0567"
    l_1_60 = "CVE-2011-0586"
    l_1_55 = {l_1_56, l_1_57, l_1_58, l_1_59, l_1_60, "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
    l_1_55 = "acrobat_reader"
    l_1_55 = "8.1.2"
    l_1_55 = "cves"
    l_1_57 = "CVE-2010-1241"
    l_1_58 = "CVE-2010-4091"
    l_1_59 = "CVE-2011-0566"
    l_1_60 = "CVE-2011-0567"
    l_1_56 = {l_1_57, l_1_58, l_1_59, l_1_60, "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
    l_1_56 = "acrobat_reader"
    l_1_56 = "8.1.4"
    l_1_56 = "cves"
    l_1_58 = "CVE-2010-1241"
    l_1_59 = "CVE-2010-4091"
    l_1_60 = "CVE-2011-0566"
    l_1_57 = {l_1_58, l_1_59, l_1_60, "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
    l_1_57 = "acrobat_reader"
    l_1_57 = "8.1.5"
    l_1_57 = "cves"
    l_1_59 = "CVE-2010-1241"
    l_1_60 = "CVE-2010-4091"
    l_1_58 = {l_1_59, l_1_60, "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
    l_1_58 = "acrobat_reader"
    l_1_58 = "8.1.6"
    l_1_58 = "cves"
    l_1_60 = "CVE-2010-1241"
    l_1_59 = {l_1_60, "CVE-2010-4091", "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
    l_1_59 = "acrobat_reader"
    l_1_59 = "8.1.7"
    l_1_59 = "cves"
    l_1_60 = {"CVE-2010-1241", "CVE-2010-4091", "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
    l_1_60 = "acrobat_reader"
    l_1_60 = "8.2"
    l_1_60 = "cves"
    -- DECOMPILER ERROR at PC3157: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC3159: Overwrote pending register: R10 in 'AssignReg'

    l_1_15 = {vendor = "adobe", product = l_1_16, vei = l_1_16, [l_1_16] = l_1_17}
    l_1_15 = "acrobat_reader"
    l_1_15 = "9.0"
    l_1_15 = "9.3.1"
    -- DECOMPILER ERROR at PC3169: Overwrote pending register: R11 in 'AssignReg'

    l_1_16 = {cve = l_1_17, vendor = "adobe", product = l_1_17, vei = l_1_17}
    l_1_16 = "acrobat_reader"
    l_1_16 = "9.0"
    l_1_16 = "9.4"
    -- DECOMPILER ERROR at PC3180: Overwrote pending register: R12 in 'AssignReg'

    l_1_17 = {vendor = "adobe", product = l_1_18, vei = l_1_18, [l_1_18] = l_1_19}
    l_1_17 = "9.0"
    l_1_17 = "9.4.1"
    l_1_17 = "cves"
    -- DECOMPILER ERROR at PC3188: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC3189: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC3190: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC3191: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC3192: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC3193: Overwrote pending register: R19 in 'AssignReg'

    -- DECOMPILER ERROR at PC3194: Overwrote pending register: R20 in 'AssignReg'

    -- DECOMPILER ERROR at PC3195: Overwrote pending register: R21 in 'AssignReg'

    -- DECOMPILER ERROR at PC3196: Overwrote pending register: R22 in 'AssignReg'

    -- DECOMPILER ERROR at PC3197: Overwrote pending register: R23 in 'AssignReg'

    -- DECOMPILER ERROR at PC3198: Overwrote pending register: R24 in 'AssignReg'

    -- DECOMPILER ERROR at PC3199: Overwrote pending register: R25 in 'AssignReg'

    -- DECOMPILER ERROR at PC3200: Overwrote pending register: R26 in 'AssignReg'

    -- DECOMPILER ERROR at PC3201: Overwrote pending register: R27 in 'AssignReg'

    -- DECOMPILER ERROR at PC3202: Overwrote pending register: R28 in 'AssignReg'

    -- DECOMPILER ERROR at PC3203: Overwrote pending register: R29 in 'AssignReg'

    -- DECOMPILER ERROR at PC3204: Overwrote pending register: R30 in 'AssignReg'

    l_1_35, l_1_34, l_1_33, l_1_32, l_1_31, l_1_30, l_1_29, l_1_28, l_1_27, l_1_26, l_1_25, l_1_24, l_1_23, l_1_22, l_1_21, l_1_20, l_1_19 = {cve = l_1_36, vendor = "adobe", product = l_1_36, vsi = l_1_36, vei = l_1_36}, {vendor = "adobe", product = l_1_35, vsi = l_1_35, vee = l_1_35, [l_1_35] = l_1_36}, {cve = l_1_34, vendor = "adobe", product = l_1_34, vsi = l_1_34, vei = l_1_34}, {vendor = "adobe", product = l_1_33, vei = l_1_33, [l_1_33] = l_1_34}, {cve = l_1_32, vendor = "adobe", product = l_1_32, vsi = l_1_32, vei = l_1_32}, {vendor = "adobe", product = l_1_31, vsi = l_1_31, vee = l_1_31, [l_1_31] = l_1_32}, {vendor = "adobe", product = l_1_30, vsi = l_1_30, vei = l_1_30, [l_1_30] = l_1_31}, {cve = l_1_29, vendor = "adobe", product = l_1_29, vsi = l_1_29, vee = l_1_29}, {vendor = "adobe", product = l_1_28, vsi = l_1_28, vee = l_1_28, [l_1_28] = l_1_29}, {vendor = "adobe", product = l_1_27, vsi = l_1_27, vei = l_1_27, [l_1_27] = l_1_28}, {vendor = "adobe", product = l_1_26, vsi = l_1_26, vei = l_1_26, [l_1_26] = l_1_27}, {cve = l_1_25, vendor = "adobe", product = l_1_25, vsi = l_1_25, vee = l_1_25}, {vendor = "adobe", product = l_1_24, vsi = l_1_24, vee = l_1_24, [l_1_24] = l_1_25}, {vendor = "adobe", product = l_1_23, vsi = l_1_23, vei = l_1_23, [l_1_23] = l_1_24}, {cve = l_1_22, vendor = "adobe", product = l_1_22, vsi = l_1_22, vei = l_1_22}, {vendor = "adobe", product = l_1_21, vsi = l_1_21, vei = l_1_21, [l_1_21] = l_1_22}, {vendor = "adobe", product = l_1_20, vsi = l_1_20, vei = l_1_20, [l_1_20] = l_1_21}
    l_1_18 = {l_1_19, l_1_20, l_1_21, l_1_22, l_1_23, l_1_24, l_1_25, l_1_26, l_1_27, l_1_28, l_1_29, l_1_30, l_1_31, l_1_32, l_1_33, l_1_34, l_1_35; vendor = "adobe", product = l_1_19, vei = l_1_19, [l_1_19] = l_1_20}
    l_1_18 = "acrobat_reader"
    l_1_18 = "9.0"
    l_1_18 = "9.4.4"
    l_1_18 = "cves"
    l_1_20 = "CVE-2011-2094"
    l_1_21 = "CVE-2011-2095"
    l_1_22 = "CVE-2011-2096"
    l_1_23 = "CVE-2011-2097"
    l_1_24 = "CVE-2011-2098"
    l_1_25 = "CVE-2011-2099"
    l_1_26 = "CVE-2011-2101"
    l_1_19 = {l_1_20, l_1_21, l_1_22, l_1_23, l_1_24, l_1_25, l_1_26}
    l_1_19 = "CVE-2012-4363"
    l_1_19 = "acrobat_reader"
    l_1_19 = "9.0"
    l_1_19 = "9.5.2"
    l_1_20 = "CVE-2013-2730"
    l_1_20 = "acrobat_reader"
    l_1_20 = "9.0"
    l_1_20 = "9.5.4"
    l_1_21 = "CVE-2010-1240"
    l_1_21 = "acrobat_reader"
    l_1_21 = "9.3.1"
    l_1_22 = "acrobat_reader"
    l_1_22 = "10.0"
    l_1_22 = "cves"
    l_1_24 = "CVE-2010-4091"
    l_1_25 = "CVE-2011-0566"
    l_1_26 = "CVE-2011-0567"
    l_1_27 = "CVE-2011-0586"
    l_1_28 = "CVE-2011-0589"
    l_1_29 = "CVE-2011-0590"
    l_1_30 = "CVE-2011-0591"
    l_1_31 = "CVE-2011-0592"
    l_1_32 = "CVE-2011-0593"
    l_1_33 = "CVE-2011-0594"
    l_1_34 = "CVE-2011-0595"
    l_1_35 = "CVE-2011-0596"
    -- DECOMPILER ERROR at PC3274: Overwrote pending register: R31 in 'AssignReg'

    -- DECOMPILER ERROR at PC3275: Overwrote pending register: R32 in 'AssignReg'

    -- DECOMPILER ERROR at PC3276: Overwrote pending register: R33 in 'AssignReg'

    -- DECOMPILER ERROR at PC3277: Overwrote pending register: R34 in 'AssignReg'

    -- DECOMPILER ERROR at PC3278: Overwrote pending register: R35 in 'AssignReg'

    -- DECOMPILER ERROR at PC3279: Overwrote pending register: R36 in 'AssignReg'

    l_1_41, l_1_40, l_1_39, l_1_38, l_1_37, l_1_36 = {cve = l_1_42, vendor = "adobe", product = l_1_42, vsi = l_1_42, vee = l_1_42}, {vendor = "adobe", product = l_1_41, vsi = l_1_41, vei = l_1_41, [l_1_41] = l_1_42}, {vendor = "adobe", product = l_1_40, vsi = l_1_40, vee = l_1_40, [l_1_40] = l_1_41}, {cve = l_1_39, vendor = "adobe", product = l_1_39, vsi = l_1_39, vee = l_1_39}, {vendor = "adobe", product = l_1_38, vsi = l_1_38, vei = l_1_38, [l_1_38] = l_1_39}, {vendor = "adobe", product = l_1_37, vsi = l_1_37, vee = l_1_37, [l_1_37] = l_1_38}
    l_1_23 = {l_1_24, l_1_25, l_1_26, l_1_27, l_1_28, l_1_29, l_1_30, l_1_31, l_1_32, l_1_33, l_1_34, l_1_35, l_1_36, l_1_37, l_1_38, l_1_39, l_1_40, l_1_41}
    l_1_23 = "acrobat_reader"
    l_1_23 = "10.0"
    l_1_23 = "10.0.3"
    l_1_23 = "cves"
    l_1_25 = "CVE-2011-2094"
    l_1_26 = "CVE-2011-2095"
    l_1_27 = "CVE-2011-2096"
    l_1_28 = "CVE-2011-2097"
    l_1_29 = "CVE-2011-2098"
    l_1_30 = "CVE-2011-2099"
    l_1_31 = "CVE-2011-2101"
    l_1_24 = {l_1_25, l_1_26, l_1_27, l_1_28, l_1_29, l_1_30, l_1_31}
    l_1_24 = "CVE-2013-2730"
    l_1_24 = "acrobat_reader"
    l_1_24 = "10.0"
    l_1_24 = "10.1.6"
    l_1_25 = "acrobat_reader"
    l_1_25 = "10.0"
    l_1_25 = "10.1.7"
    l_1_25 = "cves"
    l_1_27 = "CVE-2013-3351"
    l_1_28 = "CVE-2013-3353"
    l_1_26 = {l_1_27, l_1_28}
    l_1_26 = "acrobat_reader"
    l_1_26 = "10.0"
    l_1_26 = "10.1.9"
    l_1_26 = "cves"
    l_1_28 = "CVE-2014-0522"
    l_1_29 = "CVE-2014-0525"
    l_1_30 = "CVE-2014-0528"
    l_1_27 = {l_1_28, l_1_29, l_1_30}
    l_1_27 = "acrobat_reader"
    l_1_27 = "10.0"
    l_1_27 = "10.1.11"
    l_1_27 = "cves"
    l_1_29 = "CVE-2014-0560"
    l_1_30 = "CVE-2014-0561"
    l_1_28 = {l_1_29, l_1_30}
    l_1_28 = "CVE-2012-4363"
    l_1_28 = "acrobat_reader"
    l_1_28 = "10.1"
    l_1_29 = "CVE-2013-2730"
    l_1_29 = "acrobat_reader"
    l_1_29 = "11.0"
    l_1_29 = "11.0.2"
    l_1_30 = "acrobat_reader"
    l_1_30 = "11.0"
    l_1_30 = "11.0.3"
    l_1_30 = "cves"
    l_1_32 = "CVE-2013-3351"
    l_1_33 = "CVE-2013-3353"
    l_1_31 = {l_1_32, l_1_33}
    l_1_31 = "acrobat_reader"
    l_1_31 = "11.0"
    l_1_31 = "11.0.6"
    l_1_31 = "cves"
    l_1_33 = "CVE-2014-0522"
    l_1_34 = "CVE-2014-0525"
    l_1_35 = "CVE-2014-0528"
    l_1_32 = {l_1_33, l_1_34, l_1_35}
    l_1_32 = "acrobat_reader"
    l_1_32 = "11.0"
    l_1_32 = "11.0.8"
    l_1_32 = "cves"
    l_1_34 = "CVE-2014-0560"
    l_1_35 = "CVE-2014-0561"
    l_1_33 = {l_1_34, l_1_35}
    l_1_33 = "CVE-2010-1297"
    l_1_33 = "air"
    l_1_33 = "2.0.2.12610"
    l_1_34 = "air"
    l_1_34 = "13.0.0.83"
    l_1_34 = "13.0.0.111"
    l_1_34 = "cves"
    l_1_36 = "CVE-2014-0540"
    l_1_37 = "CVE-2014-0542"
    l_1_38 = "CVE-2014-0549"
    l_1_39 = "CVE-2014-0550"
    l_1_40 = "CVE-2014-0551"
    l_1_41 = "CVE-2014-0552"
    -- DECOMPILER ERROR at PC3440: Overwrote pending register: R37 in 'AssignReg'

    -- DECOMPILER ERROR at PC3441: Overwrote pending register: R38 in 'AssignReg'

    l_1_43, l_1_42 = {vendor = "adobe", product = l_1_44, vei = l_1_44, [l_1_44] = l_1_45}, {vendor = "adobe", product = l_1_43, vsi = l_1_43, vei = l_1_43, [l_1_43] = l_1_44}
    l_1_35 = {l_1_36, l_1_37, l_1_38, l_1_39, l_1_40, l_1_41, l_1_42, l_1_43}
    l_1_35 = "air"
    l_1_35 = "14.0.0.110"
    l_1_35 = "cves"
    l_1_37 = "CVE-2014-0540"
    l_1_38 = "CVE-2014-0542"
    l_1_36 = {l_1_37, l_1_38}
    l_1_36 = "air"
    l_1_36 = "14.0.0.110"
    l_1_36 = "cves"
    l_1_38 = "CVE-2014-0540"
    l_1_39 = "CVE-2014-0542"
    l_1_37 = {l_1_38, l_1_39}
    l_1_37 = "air"
    l_1_37 = "14.0.0.110"
    l_1_37 = "14.0.0.137"
    l_1_37 = "cves"
    l_1_39 = "CVE-2014-0549"
    l_1_40 = "CVE-2014-0550"
    l_1_41 = "CVE-2014-0551"
    l_1_42 = "CVE-2014-0552"
    l_1_43 = "CVE-2014-0555"
    -- DECOMPILER ERROR at PC3483: Overwrote pending register: R39 in 'AssignReg'

    l_1_44 = {cve = l_1_45, vendor = "adobe", product = l_1_45, vsi = l_1_45, vei = l_1_45}
    l_1_38 = {l_1_39, l_1_40, l_1_41, l_1_42, l_1_43, l_1_44}
    l_1_38 = "air"
    l_1_38 = "14.0.0.137"
    l_1_38 = "cves"
    l_1_40 = "CVE-2014-0540"
    l_1_41 = "CVE-2014-0542"
    l_1_39 = {l_1_40, l_1_41}
    l_1_39 = "air"
    l_1_39 = "14.0.0.178"
    l_1_39 = "cves"
    l_1_41 = "CVE-2014-0549"
    l_1_42 = "CVE-2014-0550"
    l_1_43 = "CVE-2014-0551"
    l_1_44 = "CVE-2014-0552"
    -- DECOMPILER ERROR at PC3510: Overwrote pending register: R40 in 'AssignReg'

    -- DECOMPILER ERROR at PC3511: Overwrote pending register: R41 in 'AssignReg'

    l_1_46, l_1_45 = {cve = l_1_47, vendor = "adobe", product = l_1_47, vsi = l_1_47, vei = l_1_47}, {cve = l_1_46, vendor = "adobe", product = l_1_46, vsi = l_1_46, vei = l_1_46}
    l_1_40 = {l_1_41, l_1_42, l_1_43, l_1_44, l_1_45, l_1_46}
    l_1_40 = "air"
    l_1_40 = "14.0.0.179"
    l_1_40 = "cves"
    l_1_42 = "CVE-2014-0549"
    l_1_43 = "CVE-2014-0550"
    l_1_44 = "CVE-2014-0551"
    l_1_45 = "CVE-2014-0552"
    l_1_46 = "CVE-2014-0555"
    -- DECOMPILER ERROR at PC3527: Overwrote pending register: R42 in 'AssignReg'

    l_1_47 = {cve = l_1_48, vendor = "adobe", product = l_1_48, vsi = l_1_48, vei = l_1_48}
    l_1_41 = {l_1_42, l_1_43, l_1_44, l_1_45, l_1_46, l_1_47}
    l_1_41 = "air"
    l_1_41 = "15.0.0.356"
    l_1_41 = "cves"
    l_1_43 = "CVE-2015-0303"
    l_1_44 = "CVE-2015-0304"
    l_1_45 = "CVE-2015-0308"
    l_1_46 = "CVE-2015-0309"
    l_1_42 = {l_1_43, l_1_44, l_1_45, l_1_46}
    l_1_42 = "air"
    l_1_42 = "17.0.0.144"
    l_1_42 = "cves"
    l_1_44 = "CVE-2015-3101"
    l_1_45 = "CVE-2015-3104"
    l_1_46 = "CVE-2015-3106"
    l_1_47 = "CVE-2015-3107"
    l_1_43 = {l_1_44, l_1_45, l_1_46, l_1_47}
    l_1_43 = "air"
    l_1_43 = "17.0.0.172"
    l_1_43 = "cves"
    l_1_45 = "CVE-2015-3101"
    l_1_46 = "CVE-2015-3104"
    l_1_47 = "CVE-2015-3106"
    -- DECOMPILER ERROR at PC3569: Overwrote pending register: R43 in 'AssignReg'

    l_1_48 = {cve = l_1_49, vendor = "adobe", product = l_1_49, vsi = l_1_49, vei = l_1_49}
    l_1_44 = {l_1_45, l_1_46, l_1_47, l_1_48}
    l_1_44 = "adobe_air"
    l_1_44 = "13.0.0.83"
    l_1_44 = "13.0.0.111"
    l_1_44 = "cves"
    l_1_46 = "CVE-2014-0540"
    l_1_47 = "CVE-2014-0542"
    l_1_48 = "CVE-2014-0549"
    -- DECOMPILER ERROR at PC3585: Overwrote pending register: R44 in 'AssignReg'

    -- DECOMPILER ERROR at PC3586: Overwrote pending register: R45 in 'AssignReg'

    -- DECOMPILER ERROR at PC3587: Overwrote pending register: R46 in 'AssignReg'

    -- DECOMPILER ERROR at PC3588: Overwrote pending register: R47 in 'AssignReg'

    -- DECOMPILER ERROR at PC3589: Overwrote pending register: R48 in 'AssignReg'

    l_1_53, l_1_52, l_1_51, l_1_50, l_1_49 = {vendor = "adobe", product = l_1_54, version = l_1_54, [l_1_54] = l_1_55}, {vendor = "adobe", product = l_1_53, version = l_1_53, [l_1_53] = l_1_54}, {cve = l_1_52, vendor = "adobe", product = l_1_52, vsi = l_1_52, vei = l_1_52}, {vendor = "adobe", product = l_1_51, vsi = l_1_51, vei = l_1_51, [l_1_51] = l_1_52}, {vendor = "adobe", product = l_1_50, version = l_1_50, [l_1_50] = l_1_51}
    l_1_45 = {l_1_46, l_1_47, l_1_48, l_1_49, l_1_50, l_1_51, l_1_52, l_1_53}
    l_1_45 = "adobe_air"
    l_1_45 = "14.0.0.110"
    l_1_45 = "cves"
    l_1_47 = "CVE-2014-0540"
    l_1_48 = "CVE-2014-0542"
    l_1_46 = {l_1_47, l_1_48}
    l_1_46 = "adobe_air"
    l_1_46 = "14.0.0.110"
    l_1_46 = "cves"
    l_1_48 = "CVE-2014-0540"
    l_1_49 = "CVE-2014-0542"
    l_1_47 = {l_1_48, l_1_49}
    l_1_47 = "adobe_air"
    l_1_47 = "14.0.0.110"
    l_1_47 = "14.0.0.137"
    l_1_47 = "cves"
    l_1_49 = "CVE-2014-0549"
    l_1_50 = "CVE-2014-0550"
    l_1_51 = "CVE-2014-0551"
    l_1_52 = "CVE-2014-0552"
    l_1_53 = "CVE-2014-0555"
    -- DECOMPILER ERROR at PC3631: Overwrote pending register: R49 in 'AssignReg'

    l_1_54 = {vendor = "adobe", product = l_1_55, version = l_1_55, [l_1_55] = l_1_56}
    l_1_48 = {l_1_49, l_1_50, l_1_51, l_1_52, l_1_53, l_1_54}
    l_1_48 = "adobe_air"
    l_1_48 = "14.0.0.137"
    l_1_48 = "cves"
    l_1_50 = "CVE-2014-0540"
    l_1_51 = "CVE-2014-0542"
    l_1_49 = {l_1_50, l_1_51}
    l_1_49 = "adobe_air"
    l_1_49 = "14.0.0.178"
    l_1_49 = "cves"
    l_1_51 = "CVE-2014-0549"
    l_1_52 = "CVE-2014-0550"
    l_1_53 = "CVE-2014-0551"
    l_1_54 = "CVE-2014-0552"
    -- DECOMPILER ERROR at PC3658: Overwrote pending register: R50 in 'AssignReg'

    -- DECOMPILER ERROR at PC3659: Overwrote pending register: R51 in 'AssignReg'

    l_1_56, l_1_55 = {vendor = "adobe", product = l_1_57, version = l_1_57, [l_1_57] = l_1_58}, {vendor = "adobe", product = l_1_56, version = l_1_56, [l_1_56] = l_1_57}
    l_1_50 = {l_1_51, l_1_52, l_1_53, l_1_54, l_1_55, l_1_56}
    l_1_50 = "adobe_air"
    l_1_50 = "14.0.0.179"
    l_1_50 = "cves"
    l_1_52 = "CVE-2014-0549"
    l_1_53 = "CVE-2014-0550"
    l_1_54 = "CVE-2014-0551"
    l_1_55 = "CVE-2014-0552"
    l_1_56 = "CVE-2014-0555"
    -- DECOMPILER ERROR at PC3675: Overwrote pending register: R52 in 'AssignReg'

    l_1_57 = {vendor = "adobe", product = l_1_58, version = l_1_58, [l_1_58] = l_1_59}
    l_1_51 = {l_1_52, l_1_53, l_1_54, l_1_55, l_1_56, l_1_57}
    l_1_51 = "adobe_air"
    l_1_51 = "15.0.0.356"
    l_1_51 = "cves"
    l_1_53 = "CVE-2015-0303"
    l_1_54 = "CVE-2015-0304"
    l_1_55 = "CVE-2015-0308"
    l_1_56 = "CVE-2015-0309"
    l_1_52 = {l_1_53, l_1_54, l_1_55, l_1_56}
    l_1_52 = "CVE-2019-8236"
    l_1_52 = "creative_cloud"
    l_1_52 = "4.6.1"
    l_1_53 = "CVE-2020-3808"
    l_1_53 = "creative_cloud"
    l_1_53 = "5.0"
    l_1_54 = "creative_cloud"
    l_1_54 = "5.1"
    l_1_54 = "cves"
    l_1_56 = "CVE-2020-9669"
    l_1_57 = "CVE-2020-9670"
    -- DECOMPILER ERROR at PC3718: Overwrote pending register: R53 in 'AssignReg'

    l_1_58 = {vendor = "adobe", product = l_1_59, version = l_1_59, [l_1_59] = l_1_60}
    l_1_55 = {l_1_56, l_1_57, l_1_58}
    l_1_55 = "creative_cloud_desktop_application"
    l_1_55 = "5.1"
    l_1_55 = "cves"
    l_1_57 = "CVE-2020-9670"
    l_1_58 = "CVE-2020-9671"
    l_1_56 = {l_1_57, l_1_58}
    l_1_56 = "oracle"
    l_1_56 = "jre"
    l_1_56 = "0"
    l_1_56 = "cves"
    l_1_58 = "CVE-2009-3867"
    -- DECOMPILER ERROR at PC3743: Overwrote pending register: R54 in 'AssignReg'

    -- DECOMPILER ERROR at PC3744: Overwrote pending register: R55 in 'AssignReg'

    -- DECOMPILER ERROR at PC3745: Overwrote pending register: R56 in 'AssignReg'

    -- DECOMPILER ERROR at PC3746: Overwrote pending register: R57 in 'AssignReg'

    -- DECOMPILER ERROR at PC3747: Overwrote pending register: R58 in 'AssignReg'

    l_1_60, l_1_59 = {vendor = "adobe", product = "acrobat_reader", version = "8.2.1", 
cves = {"CVE-2010-1241", "CVE-2010-4091", "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
}, {vendor = "adobe", product = l_1_60, version = l_1_60, 
[l_1_60] = {"CVE-2010-1241", "CVE-2010-4091", "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
}
    l_1_57 = {l_1_58, l_1_59, l_1_60, 
{vendor = "adobe", product = "acrobat_reader", version = "8.2.2", 
cves = {"CVE-2010-4091", "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
}
, 
{vendor = "adobe", product = "acrobat_reader", version = "8.2.3", 
cves = {"CVE-2010-4091", "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
}
, 
{vendor = "adobe", product = "acrobat_reader", version = "8.2.4", 
cves = {"CVE-2010-4091", "CVE-2011-0566", "CVE-2011-0567", "CVE-2011-0586", "CVE-2011-0589", "CVE-2011-0590", "CVE-2011-0591", "CVE-2011-0592", "CVE-2011-0593", "CVE-2011-0594", "CVE-2011-0595", "CVE-2011-0596", "CVE-2011-0598", "CVE-2011-0599", "CVE-2011-0600", "CVE-2011-0602", "CVE-2011-0603", "CVE-2011-0606"}
}
, "CVE-2010-4452", "CVE-2012-5076", "CVE-2012-5088"}
    l_1_57 = "oracle"
    l_1_57 = "jre"
    l_1_57 = "1.3.1_25"
    l_1_57 = "cves"
    l_1_59 = "CVE-2009-3867"
    l_1_60 = "CVE-2009-3869"
    l_1_58 = {l_1_59, l_1_60, "CVE-2009-3871", "CVE-2009-3874"}
    l_1_58 = "oracle"
    l_1_58 = "jre"
    l_1_58 = "1.4.2_22"
    l_1_58 = "cves"
    l_1_60 = "CVE-2009-3867"
    l_1_59 = {l_1_60, "CVE-2009-3869", "CVE-2009-3871", "CVE-2009-3874"}
    l_1_59 = "CVE-2013-1493"
    l_1_59 = "oracle"
    l_1_59 = "jre"
    l_1_59 = "1.5.0"
    l_1_60 = "oracle"
    l_1_60 = "jre"
    l_1_60 = "1.5.0"
    l_1_60 = "1.7.0"
    l_1_60 = "cves"
    -- DECOMPILER ERROR at PC3864: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC3866: Overwrote pending register: R10 in 'AssignReg'

    l_1_15 = {cve = l_1_16, vendor = "adobe", product = l_1_16, vsi = l_1_16, vei = l_1_16}
    l_1_15 = "jre"
    l_1_15 = "1.3.1_25"
    l_1_15 = "cves"
    -- DECOMPILER ERROR at PC3874: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC3875: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC3876: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC3877: Overwrote pending register: R15 in 'AssignReg'

    l_1_20, l_1_19, l_1_18, l_1_17 = {cve = l_1_21, vendor = "adobe", product = l_1_21, version = l_1_21}, {cve = l_1_20, vendor = "adobe", product = l_1_20, vsi = l_1_20, vei = l_1_20}, {cve = l_1_19, vendor = "adobe", product = l_1_19, vsi = l_1_19, vei = l_1_19}, {vendor = "adobe", product = l_1_18, vsi = l_1_18, vei = l_1_18, [l_1_18] = l_1_19}
    l_1_16 = {l_1_17, l_1_18, l_1_19, l_1_20; vendor = "adobe", product = l_1_17, vsi = l_1_17, vei = l_1_17, [l_1_17] = l_1_18}
    l_1_16 = "sun"
    l_1_16 = "jre"
    l_1_16 = "1.4.2_22"
    l_1_16 = "cves"
    l_1_18 = "CVE-2009-3867"
    l_1_19 = "CVE-2009-3869"
    l_1_20 = "CVE-2009-3871"
    -- DECOMPILER ERROR at PC3892: Overwrote pending register: R16 in 'AssignReg'

    l_1_21 = {vendor = "adobe", product = l_1_22, version = l_1_22, [l_1_22] = l_1_23}
    l_1_17 = {l_1_18, l_1_19, l_1_20, l_1_21}
    l_1_17 = "sun"
    l_1_17 = "jre"
    l_1_17 = "1.6.0"
    l_1_17 = "cves"
    l_1_19 = "CVE-2010-3552"
    l_1_20 = "CVE-2010-3563"
    l_1_21 = "CVE-2010-4452"
    l_1_18 = {l_1_19, l_1_20, l_1_21}
    l_1_18 = "oracle"
    l_1_18 = "jdk"
    l_1_18 = "0"
    l_1_18 = "cves"
    l_1_20 = "CVE-2008-5353"
    l_1_21 = "CVE-2013-1488"
    l_1_19 = {l_1_20, l_1_21}
    l_1_19 = "CVE-2012-1723"
    l_1_19 = "oracle"
    l_1_19 = "jdk"
    l_1_19 = "1.4.2_37"
    l_1_20 = "CVE-2007-3504"
    l_1_20 = "oracle"
    l_1_20 = "jdk"
    l_1_20 = "1.5.0"
    l_1_21 = "CVE-2012-1723"
    l_1_21 = "oracle"
    l_1_21 = "jdk"
    l_1_21 = "1.5.0"
    l_1_21 = "1.7.0"
    -- DECOMPILER ERROR at PC3952: Overwrote pending register: R17 in 'AssignReg'

    l_1_22 = {vendor = "adobe", product = l_1_23, vsi = l_1_23, vei = l_1_23, [l_1_23] = l_1_24}
    l_1_22 = "oracle"
    l_1_22 = "jdk"
    l_1_22 = "1.6.0"
    -- DECOMPILER ERROR at PC3961: Overwrote pending register: R18 in 'AssignReg'

    l_1_23 = {cve = l_1_24, vendor = "adobe", product = l_1_24, vsi = l_1_24, vei = l_1_24}
    l_1_23 = "jdk"
    l_1_23 = "1.6.0"
    l_1_23 = "1.7.0"
    l_1_23 = "cves"
    -- DECOMPILER ERROR at PC3971: Overwrote pending register: R20 in 'AssignReg'

    -- DECOMPILER ERROR at PC3972: Overwrote pending register: R21 in 'AssignReg'

    l_1_26, l_1_25 = {vendor = "adobe", product = l_1_27, vsi = l_1_27, vei = l_1_27, [l_1_27] = l_1_28}, {vendor = "adobe", product = l_1_26, vsi = l_1_26, vei = l_1_26, [l_1_26] = l_1_27}
    l_1_24 = {l_1_25, l_1_26; vendor = "adobe", product = l_1_25, vsi = l_1_25, vei = l_1_25, [l_1_25] = l_1_26}
    l_1_24 = "CVE-2008-5353"
    l_1_24 = "oracle"
    l_1_24 = "jdk"
    l_1_24 = "5.0"
    l_1_25 = "CVE-2008-5353"
    l_1_25 = "oracle"
    l_1_25 = "jdk"
    l_1_25 = "6"
    l_1_26 = "CVE-2008-5353"
    l_1_26 = "sun"
    l_1_26 = "jdk"
    l_1_26 = "0"
    -- DECOMPILER ERROR at PC4003: Overwrote pending register: R22 in 'AssignReg'

    l_1_27 = {cve = l_1_28, vendor = "adobe", product = l_1_28, vsi = l_1_28, vei = "10.1.4"}
    l_1_27 = "sun"
    l_1_27 = "jdk"
    l_1_27 = "1.5.0"
    -- DECOMPILER ERROR at PC4012: Overwrote pending register: R23 in 'AssignReg'

    l_1_28 = {cve = l_1_29, vendor = "adobe", product = l_1_29, vsi = l_1_29, vei = l_1_29}
    l_1_28 = "sun"
    l_1_28 = "jdk"
    l_1_28 = "5.0"
    -- DECOMPILER ERROR at PC4021: Overwrote pending register: R24 in 'AssignReg'

    l_1_29 = {vendor = "adobe", product = l_1_30, vsi = l_1_30, vei = l_1_30, [l_1_30] = l_1_31}
    l_1_29 = "sun"
    l_1_29 = "jdk"
    l_1_29 = "6"
    -- DECOMPILER ERROR at PC4030: Overwrote pending register: R25 in 'AssignReg'

    l_1_30 = {vendor = "adobe", product = l_1_31, vsi = l_1_31, vei = l_1_31, [l_1_31] = l_1_32}
    l_1_30 = "apple"
    l_1_30 = "itunes"
    l_1_30 = "12.9"
    -- DECOMPILER ERROR at PC4039: Overwrote pending register: R26 in 'AssignReg'

    l_1_31 = {vendor = "adobe", product = l_1_32, vsi = l_1_32, vei = l_1_32, [l_1_32] = l_1_33}
    l_1_31 = "apple"
    l_1_31 = "itunes"
    l_1_31 = "12.9.1"
    -- DECOMPILER ERROR at PC4048: Overwrote pending register: R27 in 'AssignReg'

    l_1_32 = {cve = l_1_33, vendor = "adobe", product = l_1_33, vee = l_1_33}
    l_1_32 = "itunes"
    l_1_32 = "12.10.7"
    l_1_32 = "cves"
    -- DECOMPILER ERROR at PC4056: Overwrote pending register: R29 in 'AssignReg'

    -- DECOMPILER ERROR at PC4057: Overwrote pending register: R30 in 'AssignReg'

    -- DECOMPILER ERROR at PC4058: Overwrote pending register: R31 in 'AssignReg'

    l_1_36, l_1_35, l_1_34 = {vendor = "adobe", product = l_1_37, vsi = l_1_37, vei = l_1_37, [l_1_37] = l_1_38}, {vendor = "adobe", product = l_1_36, vei = l_1_36, [l_1_36] = l_1_37}, {vendor = "adobe", product = l_1_35, version = l_1_35, [l_1_35] = l_1_36}
    l_1_33 = {l_1_34, l_1_35, l_1_36; vendor = "adobe", product = l_1_34, vsi = l_1_34, vei = l_1_34, [l_1_34] = l_1_35}
    l_1_33 = "CVE-2020-27911"
    l_1_33 = "apple"
    l_1_33 = "itunes"
    l_1_33 = "12.11"
    l_1_34 = "CVE-2018-20505"
    l_1_34 = "apple"
    l_1_34 = "icloud"
    l_1_34 = "7.10"
    l_1_35 = "CVE-2018-20506"
    l_1_35 = "apple"
    l_1_35 = "icloud"
    l_1_35 = "7.10"
    l_1_36 = "CVE-2019-8600"
    l_1_36 = "apple"
    l_1_36 = "icloud"
    l_1_36 = "7.12"
    -- DECOMPILER ERROR at PC4098: Overwrote pending register: R32 in 'AssignReg'

    l_1_37 = {vendor = "adobe", product = l_1_38, vei = l_1_38, [l_1_38] = l_1_39}
    l_1_37 = "apple"
    l_1_37 = "icloud"
    l_1_37 = "10.0"
    l_1_37 = "10.4"
    -- DECOMPILER ERROR at PC4109: Overwrote pending register: R33 in 'AssignReg'

    l_1_38 = {vendor = "adobe", product = l_1_39, vei = l_1_39, [l_1_39] = l_1_40}
    l_1_38 = "zoom"
    l_1_38 = "meetings"
    l_1_38 = "5.3.0"
    -- DECOMPILER ERROR at PC4118: Overwrote pending register: R34 in 'AssignReg'

    l_1_39 = {vendor = "adobe", product = l_1_40, vei = l_1_40, [l_1_40] = l_1_41}
    l_1_39 = "zoom"
    l_1_39 = "meetings"
    l_1_39 = "5.11.0"
    -- DECOMPILER ERROR at PC4127: Overwrote pending register: R35 in 'AssignReg'

    l_1_40 = {vendor = "adobe", product = l_1_41, vei = l_1_41, [l_1_41] = l_1_42}
    l_1_40 = "meetings"
    l_1_40 = "5.14.7"
    l_1_40 = "cves"
    -- DECOMPILER ERROR at PC4135: Overwrote pending register: R37 in 'AssignReg'

    -- DECOMPILER ERROR at PC4136: Overwrote pending register: R38 in 'AssignReg'

    l_1_43, l_1_42 = {vendor = "adobe", product = l_1_44, vsi = l_1_44, vei = l_1_44, [l_1_44] = l_1_45}, {vendor = "adobe", product = l_1_43, vei = l_1_43, [l_1_43] = l_1_44}
    l_1_41 = {l_1_42, l_1_43; vendor = "adobe", product = l_1_42, vei = l_1_42, [l_1_42] = l_1_43}
    l_1_41 = "CVE-2023-39213"
    l_1_41 = "zoom"
    l_1_41 = "meetings"
    l_1_41 = "5.15.2"
    l_1_42 = "CVE-2024-24691"
    l_1_42 = "zoom"
    l_1_42 = "meetings"
    l_1_42 = "5.16.5"
    l_1_43 = "CVE-2022-28755"
    l_1_43 = "zoom"
    l_1_43 = "zoom"
    l_1_43 = "5.11.0"
    -- DECOMPILER ERROR at PC4167: Overwrote pending register: R39 in 'AssignReg'

    l_1_44 = {vendor = "adobe", product = l_1_45, version = l_1_45, [l_1_45] = l_1_46}
    l_1_44 = "zoom"
    l_1_44 = "5.14.7"
    l_1_44 = "cves"
    -- DECOMPILER ERROR at PC4175: Overwrote pending register: R41 in 'AssignReg'

    -- DECOMPILER ERROR at PC4176: Overwrote pending register: R42 in 'AssignReg'

    l_1_47, l_1_46 = {vendor = "adobe", product = l_1_48, vei = l_1_48, [l_1_48] = l_1_49}, {vendor = "adobe", product = l_1_47, vsi = l_1_47, vei = l_1_47, [l_1_47] = l_1_48}
    l_1_45 = {l_1_46, l_1_47; vendor = "adobe", product = l_1_46, vei = l_1_46, [l_1_46] = l_1_47}
    l_1_45 = "CVE-2023-39213"
    l_1_45 = "zoom"
    l_1_45 = "zoom"
    l_1_45 = "5.15.2"
    l_1_46 = "CVE-2024-24691"
    l_1_46 = "zoom"
    l_1_46 = "zoom"
    l_1_46 = "5.16.5"
    -- DECOMPILER ERROR at PC4197: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC4199: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC4200: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC4201: Confused about usage of register: R10 in 'OutputAssignments'

    for l_1_18,l_1_19 in l_1_15 do
      l_1_17 = {vendor = l_1_18, product = l_1_18, vei = l_1_18, [l_1_18] = l_1_19}
      -- DECOMPILER ERROR at PC4203: Overwrote pending register: R15 in 'AssignReg'

      l_1_19 = {cve = l_1_20, vendor = l_1_20, product = l_1_20, vei = l_1_20}
      -- DECOMPILER ERROR at PC4204: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC4205: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC4206: Overwrote pending register: R15 in 'AssignReg'

      l_1_22, l_1_21, l_1_20 = {vendor = l_1_23, product = l_1_23, vsi = l_1_23, vei = l_1_23, [l_1_23] = l_1_24}, {cve = l_1_22, vendor = l_1_22, product = l_1_22, vee = l_1_22}, {cve = l_1_21, vendor = l_1_21, product = l_1_21, vsi = l_1_21, vei = l_1_21}
      l_1_21, l_1_14 = l_1_14[l_1_20], {cve = "CVE-2026-11670", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-63030", vendor = "wordpress", product = "wordpress", vsi = "6.9.0", vei = "6.9.4", cve = "CVE-2026-58187", vendor = "apache", product = "traffic_server", vsi = "10.0.0", vee = "10.1.4", cve = l_1_15, vendor = l_1_15, product = l_1_15, vsi = l_1_15, vee = l_1_15, cve = l_1_15, vendor = l_1_15, product = l_1_15, vee = l_1_15, cve = l_1_15, vendor = "adobe", product = l_1_15, vsi = l_1_15, vee = l_1_15, cve = l_1_15, vendor = "adobe", product = l_1_15, vsi = l_1_15, vei = l_1_15, vendor = l_1_15, product = l_1_15, vei = l_1_15, [l_1_15] = l_1_16}
      l_1_22 = nil
      if l_1_21 == l_1_22 then
        l_1_22 = l_1_19.vendor
        l_1_22 = l_1_19.product
        l_1_22 = "rs"
        l_1_23 = {cve = l_1_24, vendor = l_1_24, product = l_1_24, vei = l_1_24}
        l_1_21 = {vendor = l_1_22, product = l_1_22, [l_1_22] = l_1_23}
      end
      l_1_21 = l_1_14[l_1_20]
      l_1_22 = "rs"
      l_1_21 = l_1_21[l_1_22]
      l_1_22 = l_1_14[l_1_20]
      l_1_23 = "rs"
      l_1_22 = l_1_22[l_1_23]
      l_1_22 = #l_1_22
      l_1_23 = 1
      l_1_22 = l_1_22 + l_1_23
    end
    for i_1,l_1_20 in pairs(l_1_14) do
      -- DECOMPILER ERROR at PC4243: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC4244: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC4247: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC4248: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC4250: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC4253: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC4254: Overwrote pending register: R18 in 'AssignReg'

      if l_1_22 == l_1_23 then
        for l_1_25,l_1_26 in l_1_22 do
          -- DECOMPILER ERROR at PC4257: Overwrote pending register: R22 in 'AssignReg'

          -- DECOMPILER ERROR at PC4258: Overwrote pending register: R23 in 'AssignReg'

          -- DECOMPILER ERROR at PC4260: Overwrote pending register: R23 in 'AssignReg'

          -- DECOMPILER ERROR at PC4263: Overwrote pending register: R23 in 'AssignReg'

          -- DECOMPILER ERROR at PC4264: Overwrote pending register: R24 in 'AssignReg'

          -- DECOMPILER ERROR at PC4265: Overwrote pending register: R24 in 'AssignReg'

          if l_1_27 ~= l_1_28 then
            for l_1_31,l_1_32 in l_1_28 do
              -- DECOMPILER ERROR at PC4268: Overwrote pending register: R28 in 'AssignReg'

              -- DECOMPILER ERROR at PC4269: Overwrote pending register: R29 in 'AssignReg'

              l_1_32 = {cve = l_1_33, vendor = l_1_33, product = l_1_33, vee = l_1_33}
              -- DECOMPILER ERROR at PC4270: Overwrote pending register: R30 in 'AssignReg'

              -- DECOMPILER ERROR at PC4271: Confused about usage of register: R28 in 'OutputAssignments'

              if l_1_33 then
                l_1_33 = l_1_32.cve
                if l_1_33 then
                  l_1_33 = inventory
                  l_1_34 = "AddVulnerability"
                  l_1_33 = l_1_33[l_1_34]
                  l_1_34 = l_1_26
                  l_1_35 = l_1_32.cve
                  l_1_33(l_1_34, l_1_35)
                end
                l_1_33 = "cves"
                l_1_33 = l_1_32[l_1_33]
                if l_1_33 then
                  l_1_33 = ipairs
                  l_1_34 = "cves"
                  l_1_34 = l_1_32[l_1_34]
                  l_1_33 = l_1_33(l_1_34)
                  for l_1_36,l_1_37 in l_1_33 do
                    -- DECOMPILER ERROR at PC4292: Overwrote pending register: R33 in 'AssignReg'

                    -- DECOMPILER ERROR at PC4293: Overwrote pending register: R34 in 'AssignReg'

                    -- DECOMPILER ERROR at PC4294: Overwrote pending register: R33 in 'AssignReg'

                    l_1_38, l_1_39 = {cve = l_1_39, vendor = l_1_39, product = l_1_39, vee = l_1_39}, {vendor = l_1_40, product = l_1_40, vee = l_1_40, [l_1_40] = l_1_41}
                    l_1_39 = l_1_26
                    -- DECOMPILER ERROR at PC4296: Overwrote pending register: R35 in 'AssignReg'

                    l_1_37 = {cve = l_1_38, vendor = l_1_38, product = l_1_38, vee = l_1_38}
                    l_1_38(l_1_39, l_1_40)
                    l_1_40 = {cve = l_1_41, vendor = l_1_41, product = l_1_41, vee = l_1_41}
                  end
                end
              end
            end
          end
        end
      end
    end
    -- DECOMPILER ERROR at PC4306: Confused about usage of register R32 for local variables in 'ReleaseLocals'

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

