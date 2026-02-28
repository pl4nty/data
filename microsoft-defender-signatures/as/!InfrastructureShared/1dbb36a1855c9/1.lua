local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = safeJsonDeserialize
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    if not L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = UrlGrader
L2_1 = L0_1.Url
L3_1 = "PFATamper.E"
L4_1 = false
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L0_1.Url = L2_1
L3_1 = nil
L4_1 = nil
L5_1 = L0_1.AttributeValue
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L0_1.AttributeValue
L6_1 = safeJsonDeserialize
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L3_1 = L6_1.AppName
  L4_1 = L6_1.Pid
else
  L8_1 = L5_1
  L7_1 = L5_1.match
  L9_1 = "[^|]+"
  L7_1 = L7_1(L8_1, L9_1)
  L3_1 = L7_1
  L8_1 = L5_1
  L7_1 = L5_1.match
  L9_1 = "|(pid[^|]+)"
  L7_1 = L7_1(L8_1, L9_1)
  L4_1 = L7_1
end
if not L3_1 or not L4_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = {}
L7_1.isThreat = false
L8_1 = this_sigattrlog
L8_1 = L8_1[2]
L8_1 = L8_1.matched
if L8_1 then
  L7_1.type = "BM_SIGTRIGGER"
  L8_1 = this_sigattrlog
  L8_1 = L8_1[2]
  L8_1 = L8_1.utf8p1
  L7_1.event = L8_1
  L8_1 = this_sigattrlog
  L8_1 = L8_1[2]
  L8_1 = L8_1.utf8p2
  L8_1 = L8_1 == "THREAT" and L8_1
  L7_1.isThreat = L8_1
  L8_1 = this_sigattrlog
  L8_1 = L8_1[2]
  L8_1 = L8_1.image_path
  L7_1.processName = L8_1
else
  L8_1 = this_sigattrlog
  L8_1 = L8_1[3]
  L8_1 = L8_1.matched
  if L8_1 then
    L7_1.type = "BM_SIGTRIGGER"
    L8_1 = this_sigattrlog
    L8_1 = L8_1[3]
    L8_1 = L8_1.utf8p1
    L7_1.event = L8_1
    L8_1 = this_sigattrlog
    L8_1 = L8_1[3]
    L8_1 = L8_1.utf8p2
    L8_1 = L8_1 == "THREAT" and L8_1
    L7_1.isThreat = L8_1
    L8_1 = this_sigattrlog
    L8_1 = L8_1[3]
    L8_1 = L8_1.image_path
    L7_1.processName = L8_1
  else
    L8_1 = this_sigattrlog
    L8_1 = L8_1[4]
    L8_1 = L8_1.matched
    if L8_1 then
      L7_1.type = "BM_SIGTRIGGER"
      L8_1 = this_sigattrlog
      L8_1 = L8_1[4]
      L8_1 = L8_1.utf8p1
      L7_1.event = L8_1
      L8_1 = this_sigattrlog
      L8_1 = L8_1[4]
      L8_1 = L8_1.utf8p2
      L8_1 = L8_1 == "THREAT" and L8_1
      L7_1.isThreat = L8_1
      L8_1 = this_sigattrlog
      L8_1 = L8_1[4]
      L8_1 = L8_1.image_path
      L7_1.processName = L8_1
    else
      L8_1 = this_sigattrlog
      L8_1 = L8_1[5]
      L8_1 = L8_1.matched
      if L8_1 then
        L7_1.type = "BM_TP_IGNORE"
        L8_1 = this_sigattrlog
        L8_1 = L8_1[5]
        L8_1 = L8_1.reg_block_usermode
        L7_1.block_usermode = L8_1
        L8_1 = this_sigattrlog
        L8_1 = L8_1[5]
        L8_1 = L8_1.utf8p1
        L7_1.event = L8_1
        L7_1.isThreat = false
        L8_1 = this_sigattrlog
        L8_1 = L8_1[5]
        L8_1 = L8_1.image_path
        L7_1.processName = L8_1
      else
        L8_1 = this_sigattrlog
        L8_1 = L8_1[6]
        L8_1 = L8_1.matched
        if L8_1 then
          L7_1.type = "BM_TP_IGNORE"
          L8_1 = this_sigattrlog
          L8_1 = L8_1[6]
          L8_1 = L8_1.reg_block_usermode
          L7_1.block_usermode = L8_1
          L8_1 = this_sigattrlog
          L8_1 = L8_1[6]
          L8_1 = L8_1.utf8p1
          L7_1.event = L8_1
          L7_1.isThreat = false
          L8_1 = this_sigattrlog
          L8_1 = L8_1[6]
          L8_1 = L8_1.image_path
          L7_1.processName = L8_1
        else
          L8_1 = this_sigattrlog
          L8_1 = L8_1[7]
          L8_1 = L8_1.matched
          if L8_1 then
            L7_1.type = "BM_TP_BLOCK"
            L8_1 = this_sigattrlog
            L8_1 = L8_1[7]
            L8_1 = L8_1.reg_block_usermode
            L7_1.block_usermode = L8_1
            L8_1 = this_sigattrlog
            L8_1 = L8_1[7]
            L8_1 = L8_1.utf8p1
            L7_1.event = L8_1
            L7_1.isThreat = true
            L8_1 = this_sigattrlog
            L8_1 = L8_1[7]
            L8_1 = L8_1.image_path
            L7_1.processName = L8_1
          else
            L8_1 = this_sigattrlog
            L8_1 = L8_1[8]
            L8_1 = L8_1.matched
            if L8_1 then
              L7_1.type = "BM_TP_BLOCK"
              L8_1 = this_sigattrlog
              L8_1 = L8_1[8]
              L8_1 = L8_1.reg_block_usermode
              L7_1.block_usermode = L8_1
              L8_1 = this_sigattrlog
              L8_1 = L8_1[8]
              L8_1 = L8_1.utf8p1
              L7_1.event = L8_1
              L7_1.isThreat = true
              L8_1 = this_sigattrlog
              L8_1 = L8_1[8]
              L8_1 = L8_1.image_path
              L7_1.processName = L8_1
            else
              L8_1 = this_sigattrlog
              L8_1 = L8_1[9]
              L8_1 = L8_1.matched
              if L8_1 then
                L7_1.type = "CMD_DETECTION"
                L8_1 = this_sigattrlog
                L8_1 = L8_1[9]
                L8_1 = L8_1.utf8p2
                L7_1.event = L8_1
                L8_1 = this_sigattrlog
                L8_1 = L8_1[9]
                L8_1 = L8_1.utf8p1
                L8_1 = L8_1 == "BM_BLOCKPROCESSCREATE" and L8_1
                L7_1.isThreat = L8_1
                L8_1 = this_sigattrlog
                L8_1 = L8_1[9]
                L8_1 = L8_1.image_path
                L7_1.processName = L8_1
              else
                L8_1 = this_sigattrlog
                L8_1 = L8_1[10]
                L8_1 = L8_1.matched
                if L8_1 then
                  L7_1.type = "AMSI_DETECTION"
                  L8_1 = this_sigattrlog
                  L8_1 = L8_1[10]
                  L8_1 = L8_1.utf8p1
                  L7_1.event = L8_1
                  L8_1 = this_sigattrlog
                  L8_1 = L8_1[10]
                  L8_1 = L8_1.utf8p2
                  L8_1 = L8_1 == "INFECTED" and L8_1
                  L7_1.isThreat = L8_1
                  L8_1 = this_sigattrlog
                  L8_1 = L8_1[10]
                  L8_1 = L8_1.image_path
                  L7_1.processName = L8_1
                end
              end
            end
          end
        end
      end
    end
  end
end
L8_1 = add_parents
L8_1()
L8_1 = bm
L8_1 = L8_1.get_current_process_startup_info
L8_1 = L8_1()
L9_1 = reportRelevantUntrustedEntitiesForPid
L10_1 = L8_1.ppid
L9_1 = L9_1(L10_1)
L10_1 = bm
L10_1 = L10_1.add_related_string
L11_1 = "UntrustedEntities"
L12_1 = safeJsonSerialize
L13_1 = L9_1
L12_1 = L12_1(L13_1)
L13_1 = bm
L13_1 = L13_1.RelatedStringBMReport
L10_1(L11_1, L12_1, L13_1)
L0_1.TamperingEvent = L7_1
L10_1 = bm
L10_1 = L10_1.add_related_string
L11_1 = "AdditionalInfo"
L12_1 = safeJsonSerialize
L13_1 = L0_1
L12_1 = L12_1(L13_1)
L13_1 = bm
L13_1 = L13_1.RelatedStringBMReport
L10_1(L11_1, L12_1, L13_1)
L10_1 = nil
L11_1 = L0_1.AttributeName
if L11_1 == "PFApp_Parent" then
  L10_1 = "PFServers"
else
  L10_1 = "programfiles_Net"
end
L11_1 = startTrackingApp
L12_1 = L4_1
L13_1 = L3_1
L14_1 = L10_1
L15_1 = L0_1.AttributeName
L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
if not L11_1 then
  L12_1.SignatureName = "PFATamper.E"
  L13_1 = bm
  L13_1 = L13_1.trigger_sig
  L14_1 = "ProcAttribError"
  L15_1 = safeJsonSerialize
  L16_1 = L12_1
  L15_1, L16_1, L17_1, L18_1, L19_1 = L15_1(L16_1)
  L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
else
  L13_1 = L7_1.isThreat
  if L13_1 then
    L13_1 = 30
    if L13_1 then
      goto lbl_328
    end
  end
  L13_1 = 10
  ::lbl_328::
  L14_1 = "Tampering["
  L15_1 = L8_1.ppid
  L16_1 = L15_1
  L15_1 = L15_1.match
  L17_1 = "pid:(%d+)"
  L15_1 = L15_1(L16_1, L17_1)
  L16_1 = "]["
  L17_1 = L7_1.event
  L18_1 = "]"
  L14_1 = L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1
  L15_1 = IncreaseProcessAnomalyScore
  L16_1 = L8_1.ppid
  L17_1 = L13_1
  L18_1 = L14_1
  L19_1 = L0_1.AttributeName
  L15_1(L16_1, L17_1, L18_1, L19_1)
end
L13_1 = mp
L13_1 = L13_1.INFECTED
return L13_1
