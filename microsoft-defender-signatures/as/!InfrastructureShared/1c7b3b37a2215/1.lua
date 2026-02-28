local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = 5
L1_1 = "servicestop"
L2_1 = ""
L3_1 = {}
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L2_1 = L4_1.utf8p2
  L4_1 = #L3_1
  L4_1 = L4_1 + 1
  L6_1 = L2_1
  L5_1 = L2_1.match
  L7_1 = "stop ([^%s]+)"
  L5_1 = L5_1(L6_1, L7_1)
  L3_1[L4_1] = L5_1
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L2_1 = L4_1.utf8p2
    L4_1 = #L3_1
    L4_1 = L4_1 + 1
    L6_1 = L2_1
    L5_1 = L2_1.match
    L7_1 = "pause ([^%s]+)"
    L5_1 = L5_1(L6_1, L7_1)
    L3_1[L4_1] = L5_1
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L2_1 = L4_1.utf8p2
      L4_1 = #L3_1
      L4_1 = L4_1 + 1
      L6_1 = L2_1
      L5_1 = L2_1.match
      L7_1 = "stop ([^%s]+)"
      L5_1 = L5_1(L6_1, L7_1)
      L3_1[L4_1] = L5_1
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[4]
        L2_1 = L4_1.utf8p2
        L4_1 = #L3_1
        L4_1 = L4_1 + 1
        L6_1 = L2_1
        L5_1 = L2_1.match
        L7_1 = "delete ([^%s]+)"
        L5_1 = L5_1(L6_1, L7_1)
        L3_1[L4_1] = L5_1
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[6]
          L2_1 = L4_1.utf8p2
          L4_1 = #L3_1
          L4_1 = L4_1 + 1
          L6_1 = L2_1
          L5_1 = L2_1.match
          L7_1 = "/im ([^%s]+)"
          L5_1 = L5_1(L6_1, L7_1)
          L3_1[L4_1] = L5_1
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[7]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[7]
            L2_1 = L4_1.utf8p2
            L4_1 = #L3_1
            L4_1 = L4_1 + 1
            L6_1 = L2_1
            L5_1 = L2_1.match
            L7_1 = "-im ([^%s]+)"
            L5_1 = L5_1(L6_1, L7_1)
            L3_1[L4_1] = L5_1
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[5]
            L4_1 = L4_1.matched
            if L4_1 then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[5]
              L2_1 = L4_1.utf8p2
              L4_1 = string
              L4_1 = L4_1.match
              L5_1 = L2_1
              L6_1 = "ame%s-([^%-%/]+)%s-[%-%/]"
              L4_1 = L4_1(L5_1, L6_1)
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L4_1
              L7_1 = ","
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if L5_1 then
                L5_1 = string
                L5_1 = L5_1.gsub
                L6_1 = L4_1
                L7_1 = " "
                L8_1 = ""
                L5_1 = L5_1(L6_1, L7_1, L8_1)
                L4_1 = L5_1
                L5_1 = ipairs
                L6_1 = split
                L7_1 = L4_1
                L8_1 = ","
                L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L6_1(L7_1, L8_1)
                L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
                for L8_1, L9_1 in L5_1, L6_1, L7_1 do
                  L10_1 = #L3_1
                  L10_1 = L10_1 + 1
                  L3_1[L10_1] = L9_1
                end
              end
            else
              L4_1 = this_sigattrlog
              L4_1 = L4_1[8]
              L4_1 = L4_1.matched
              if L4_1 then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[8]
                L2_1 = L4_1.utf8p2
                L4_1 = #L3_1
                L4_1 = L4_1 + 1
                L6_1 = L2_1
                L5_1 = L2_1.match
                L7_1 = "uninstall ([^%s]+)"
                L5_1 = L5_1(L6_1, L7_1)
                L3_1[L4_1] = L5_1
              else
                L4_1 = this_sigattrlog
                L4_1 = L4_1[9]
                L4_1 = L4_1.matched
                if L4_1 then
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[9]
                  L2_1 = L4_1.utf8p2
                  L4_1 = #L3_1
                  L4_1 = L4_1 + 1
                  L6_1 = L2_1
                  L5_1 = L2_1.match
                  L7_1 = "service%-where%-(['\"][^%s]+['\"])"
                  L5_1 = L5_1(L6_1, L7_1)
                  L3_1[L4_1] = L5_1
                else
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[10]
                  L4_1 = L4_1.matched
                  if L4_1 then
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[10]
                    L2_1 = L4_1.utf8p2
                    L4_1 = #L3_1
                    L4_1 = L4_1 + 1
                    L6_1 = L2_1
                    L5_1 = L2_1.match
                    L7_1 = "set-service ([^%s]+)"
                    L5_1 = L5_1(L6_1, L7_1)
                    L3_1[L4_1] = L5_1
                  else
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[11]
                    L4_1 = L4_1.matched
                    if L4_1 then
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[11]
                      L2_1 = L4_1.utf8p2
                      L4_1 = #L3_1
                      L4_1 = L4_1 + 1
                      L6_1 = L2_1
                      L5_1 = L2_1.match
                      L7_1 = "(%%.*%%)"
                      L5_1 = L5_1(L6_1, L7_1)
                      L3_1[L4_1] = L5_1
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
L4_1 = #L3_1
if L0_1 < L4_1 then
  L4_1 = pairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = bm
    L9_1 = L9_1.add_related_string
    L10_1 = "service_kill"
    L11_1 = L8_1
    L12_1 = bm
    L12_1 = L12_1.RelatedStringBMReport
    L9_1(L10_1, L11_1, L12_1)
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = pairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = MpCommon
  L9_1 = L9_1.QueryPersistContextNoPath
  L10_1 = L1_1
  L11_1 = L8_1
  L9_1 = L9_1(L10_1, L11_1)
  if not L9_1 then
    L10_1 = MpCommon
    L10_1 = L10_1.AppendPersistContextNoPath
    L11_1 = L1_1
    L12_1 = L8_1
    L13_1 = 600
    L10_1(L11_1, L12_1, L13_1)
  end
end
L4_1 = MpCommon
L4_1 = L4_1.GetPersistContextCountNoPath
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if L0_1 < L4_1 then
  L5_1 = safeJsonSerialize
  L6_1 = MpCommon
  L6_1 = L6_1.GetPersistContextNoPath
  L7_1 = L1_1
  L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L6_1(L7_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
  L3_1 = L5_1
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "service_stop"
  L7_1 = L3_1
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = MpCommon
  L5_1 = L5_1.SetPersistContextNoPath
  L6_1 = L1_1
  L7_1 = {}
  L8_1 = 1
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
