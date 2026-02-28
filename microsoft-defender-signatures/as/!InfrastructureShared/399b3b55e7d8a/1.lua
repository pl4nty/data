local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = GetAppomalyProcessAttribute
L2_1 = L0_1.ppid
L1_1, L2_1 = L1_1(L2_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1.isThreat = false
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p1
  L3_1.alert = L4_1
  L3_1.type = "SIGTRIGGER"
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.utf8p1
    L3_1.alert = L4_1
    L3_1.type = "SIGTRIGGER"
    L3_1.isThreat = true
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      L4_1 = L4_1.utf8p2
      L3_1.alert = L4_1
      L3_1.type = "SIGTRIGGER"
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[7]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[7]
        L4_1 = L4_1.utf8p2
        L3_1.alert = L4_1
        L3_1.isThreat = true
        L3_1.type = "SIGTRIGGER"
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[8]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[8]
          L4_1 = L4_1.utf8p2
          L3_1.alert = L4_1
          L3_1.isThreat = true
          L3_1.type = "SIGTRIGGER"
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[9]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[9]
            L4_1 = L4_1.utf8p1
            L3_1.alert = L4_1
            L3_1.type = "SIGTRIGGER"
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[10]
            L4_1 = L4_1.matched
            if L4_1 then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[10]
              L4_1 = L4_1.utf8p1
              L3_1.alert = L4_1
              L3_1.isThreat = true
              L3_1.type = "SIGTRIGGER"
            else
              L4_1 = this_sigattrlog
              L4_1 = L4_1[11]
              L4_1 = L4_1.matched
              if L4_1 then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[11]
                L4_1 = L4_1.utf8p1
                L3_1.alert = L4_1
                L3_1.type = "Exclusion"
              else
                L4_1 = this_sigattrlog
                L4_1 = L4_1[12]
                L4_1 = L4_1.matched
                if L4_1 then
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[12]
                  L4_1 = L4_1.utf8p1
                  L3_1.alert = L4_1
                  L3_1.type = "Exclusion"
                else
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[13]
                  L4_1 = L4_1.matched
                  if L4_1 then
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[13]
                    L4_1 = L4_1.utf8p1
                    L3_1.alert = L4_1
                    L3_1.type = "Tampering"
                  else
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[14]
                    L4_1 = L4_1.matched
                    if L4_1 then
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[14]
                      L4_1 = L4_1.utf8p1
                      L3_1.alert = L4_1
                      L3_1.type = "Tampering"
                    else
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[15]
                      L4_1 = L4_1.matched
                      if L4_1 then
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[15]
                        L4_1 = L4_1.utf8p1
                        L3_1.alert = L4_1
                        L3_1.type = "Tampering"
                        L3_1.isThreat = true
                      else
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[16]
                        L4_1 = L4_1.matched
                        if L4_1 then
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[16]
                          L4_1 = L4_1.utf8p1
                          L3_1.alert = L4_1
                          L3_1.type = "Tampering"
                          L3_1.isThreat = true
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
L4_1 = L3_1.alert
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = AlertGrading
L5_1 = L3_1
L6_1 = L0_1.ppid
L4_1 = L4_1(L5_1, L6_1)
L3_1.score = L4_1
L4_1 = "["
L5_1 = L3_1.type
L6_1 = "]["
L7_1 = L0_1.ppid
L8_1 = L7_1
L7_1 = L7_1.match
L9_1 = "pid:(%d+)"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = "]["
L9_1 = L3_1.alert
L10_1 = "]"
L4_1 = L4_1 .. L5_1 .. L6_1 .. L7_1 .. L8_1 .. L9_1 .. L10_1
L5_1 = IncreaseProcessAnomalyScore
L6_1 = L0_1.ppid
L7_1 = L3_1.score
L8_1 = L4_1
L9_1 = L1_1
L10_1 = {}
L11_1 = L3_1.isThreat
L10_1.isThreat = L11_1
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
if not L5_1 then
  L7_1 = {}
  L7_1.SignatureName = "BM/PFATamper.D"
  L8_1 = bm
  L8_1 = L8_1.get_imagepath
  L8_1 = L8_1()
  L7_1.ProcessName = L8_1
  L7_1.err = L6_1
  L7_1.AttributeValue = L2_1
  L8_1 = safeJsonSerialize
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "ProcAttribError"
  L11_1 = L8_1
  L9_1(L10_1, L11_1)
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "Error"
  L11_1 = L8_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
else
  L2_1 = L6_1
end
L3_1.ProcessAttribute = L2_1
L7_1 = bm
L7_1 = L7_1.add_related_string
L8_1 = "Event"
L9_1 = safeJsonSerialize
L10_1 = L3_1
L9_1 = L9_1(L10_1)
L10_1 = bm
L10_1 = L10_1.RelatedStringBMReport
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
