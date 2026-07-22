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

    -- DECOMPILER ERROR at PC631: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC633: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC634: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC635: Confused about usage of register: R9 in 'OutputAssignments'

    for l_1_17,l_1_18 in l_1_14 do
      l_1_16 = {cve = "CVE-2026-11673", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-60137", vendor = "wordpress", product = "wordpress", vsi = "6.9.0", vei = "6.9.4"}
      -- DECOMPILER ERROR at PC637: Overwrote pending register: R14 in 'AssignReg'

      l_1_18 = {cve = "CVE-2026-11675", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13774", vendor = "google", product = "chrome", vee = "150.0.7871.114"}
      -- DECOMPILER ERROR at PC638: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC639: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC640: Overwrote pending register: R14 in 'AssignReg'

      l_1_21, l_1_20, l_1_19 = {cve = "CVE-2026-11678", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13777", vendor = "google", product = "chrome", vee = "150.0.7871.114"}, {cve = "CVE-2026-11677", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-13776", vendor = "google", product = "chrome", vee = "150.0.7871.114"}, {cve = "CVE-2026-11676", vendor = "google", product = "chrome", vee = "149.0.7827.102", cve = "CVE-2026-13775", vendor = "google", product = "chrome", vee = "150.0.7871.114"}
      l_1_20, l_1_13 = l_1_13[l_1_19], {cve = "CVE-2026-11670", vendor = "google", product = "chrome", vee = "149.0.7827.103", cve = "CVE-2026-63030", vendor = "wordpress", product = "wordpress", vsi = "6.9.0", vei = "6.9.4"}
      if l_1_20 == nil then
        l_1_21 = l_1_18.vendor
        l_1_21 = l_1_18.product
        l_1_21 = {}
        l_1_20 = {vendor = l_1_21, product = l_1_21, rs = l_1_21}
      end
      l_1_20 = l_1_13[l_1_19]
      l_1_20 = l_1_20.rs
      l_1_21 = l_1_13[l_1_19]
      l_1_21 = l_1_21.rs
      l_1_21 = #l_1_21
      l_1_21 = l_1_21 + 1
    end
    for i_1,l_1_19 in pairs(l_1_13) do
      -- DECOMPILER ERROR at PC671: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC673: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC675: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC676: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC680: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC681: Overwrote pending register: R17 in 'AssignReg'

      if l_1_21 == "table" then
        for l_1_24,l_1_25 in l_1_21 do
          -- DECOMPILER ERROR at PC684: Overwrote pending register: R21 in 'AssignReg'

          -- DECOMPILER ERROR at PC685: Overwrote pending register: R22 in 'AssignReg'

          -- DECOMPILER ERROR at PC689: Overwrote pending register: R22 in 'AssignReg'

          -- DECOMPILER ERROR at PC690: Overwrote pending register: R23 in 'AssignReg'

          if l_1_26 ~= nil then
            for l_1_30,l_1_31 in l_1_27 do
              -- DECOMPILER ERROR at PC693: Overwrote pending register: R27 in 'AssignReg'

              -- DECOMPILER ERROR at PC694: Overwrote pending register: R28 in 'AssignReg'

              l_1_31 = {cve = "CVE-2026-34356", vendor = "apache", product = "http_server", vsi = "2.4.0", vee = "2.4.68", cve = "CVE-2026-13787", vendor = "google", product = "chrome", vee = "150.0.7871.114"}
              -- DECOMPILER ERROR at PC695: Overwrote pending register: R29 in 'AssignReg'

              -- DECOMPILER ERROR at PC696: Confused about usage of register: R27 in 'OutputAssignments'

              if l_1_32 then
                l_1_32 = inventory
                l_1_32 = l_1_32.AddVulnerability
                l_1_33 = l_1_25
                l_1_34 = l_1_31.cve
                l_1_32(l_1_33, l_1_34)
              end
            end
          end
        end
      end
    end
    -- DECOMPILER ERROR at PC710: Confused about usage of register R26 for local variables in 'ReleaseLocals'

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

