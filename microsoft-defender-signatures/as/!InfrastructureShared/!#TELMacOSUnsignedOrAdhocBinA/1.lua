local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 5) then
    goto lbl_26
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "/private/tmp/"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "/Users/[^/]+/Downloads/"
  L5_1 = 1
  L6_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= 1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "/Users/[^/]+/Desktop/"
    L5_1 = 1
    L6_1 = false
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= 1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "/Users/[^/]+/Documents/"
      L5_1 = 1
      L6_1 = false
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= 1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "^/Users/[^/]+/Library/[^/]+$"
        L5_1 = 1
        L6_1 = false
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 ~= 1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "^/Users/[^/]+/Library/[^/]+/[^/]+$"
          L5_1 = 1
          L6_1 = false
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 ~= 1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "^/Library/[^/]+$"
            L5_1 = 1
            L6_1 = false
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if L2_1 ~= 1 then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L1_1
              L4_1 = "^/Library/[^/]+/[^/]+$"
              L5_1 = 1
              L6_1 = false
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if L2_1 ~= 1 then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L1_1
                L4_1 = "/Users/Shared/"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if L2_1 ~= 1 then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L1_1
                  L4_1 = "/Users/[^/]+/%.[^/]+$"
                  L5_1 = 1
                  L6_1 = false
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if L2_1 ~= 1 then
                    L2_1 = string
                    L2_1 = L2_1.find
                    L3_1 = L1_1
                    L4_1 = "/tmp/"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if L2_1 ~= 1 then
                      L2_1 = string
                      L2_1 = L2_1.find
                      L3_1 = L1_1
                      L4_1 = "/Library/PrivilegedHelperTools/"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if L2_1 ~= 1 then
                        L2_1 = string
                        L2_1 = L2_1.find
                        L3_1 = L1_1
                        L4_1 = "/Volumes/.*/[^/]+.app/Contents/"
                        L5_1 = 1
                        L6_1 = false
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if L2_1 ~= 1 then
                          L2_1 = string
                          L2_1 = L2_1.find
                          L3_1 = L1_1
                          L4_1 = "/Volumes/.*/%.[^/]+$"
                          L5_1 = 1
                          L6_1 = false
                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                          if L2_1 ~= 1 then
                            L2_1 = string
                            L2_1 = L2_1.find
                            L3_1 = L1_1
                            L4_1 = "/Library/Caches/[^/]+$"
                            L5_1 = 1
                            L6_1 = false
                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                            if L2_1 ~= 1 then
                              L2_1 = string
                              L2_1 = L2_1.find
                              L3_1 = L1_1
                              L4_1 = "^/private/var/folders/.*TemporaryItems/NSIRD_ArchiveService_"
                              L5_1 = 1
                              L6_1 = false
                              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                              if L2_1 ~= 1 then
                                L2_1 = string
                                L2_1 = L2_1.find
                                L3_1 = L1_1
                                L4_1 = "/usr/local/bin/"
                                L5_1 = 1
                                L6_1 = true
                                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                if L2_1 ~= 1 then
                                  L2_1 = string
                                  L2_1 = L2_1.find
                                  L3_1 = L1_1
                                  L4_1 = "^/var/folders/[^/]+/[^/]+/T/"
                                  L5_1 = 1
                                  L6_1 = false
                                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                  if L2_1 ~= 1 then
                                    L2_1 = mp
                                    L2_1 = L2_1.CLEAN
                                    return L2_1
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
          end
        end
      end
    end
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "->(MachO-UniBin-"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L3_1 = L1_1
  L2_1 = L1_1.gsub
  L4_1 = "%->%(MachO%-UniBin%-.*"
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
end
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsAdhocMacOSExcluded
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsExcludedByImagePathMacOS
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.GetCertificateInfo
L3_1 = L3_1()
L4_1 = #L3_1
if L4_1 < 1 or L3_1 == nil then
  L4_1 = "MAC_UNS_ADHOC_PATHS"
  if L2_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.BmTriggerSig
    L6_1 = L2_1
    L7_1 = "BM_UnsignedOrAdhocMacBin"
    L8_1 = L1_1
    L5_1(L6_1, L7_1, L8_1)
  end
  L5_1 = 86400
  L6_1 = IsKeyValuePairInRollingQueue
  L7_1 = L4_1
  L8_1 = "unsigned_adhoc_items"
  L9_1 = L1_1
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 then
    L6_1 = AppendToRollingQueue
    L7_1 = L4_1
    L8_1 = "unsigned_adhoc_items"
    L9_1 = L1_1
    L10_1 = L5_1
    L11_1 = 1000
    L12_1 = 0
    L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
    L6_1 = TrackPidAndTechnique
    L7_1 = L2_1
    L8_1 = "T1204.002"
    L9_1 = "Execution_UserExecution_UnsignedAdhocFile"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
