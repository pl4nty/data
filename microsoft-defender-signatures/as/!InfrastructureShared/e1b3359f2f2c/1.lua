local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = GetRollingQueueKeys
L1_1 = "SuspOwaAccess"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "table" then
    L1_1 = "["
    L2_1 = ipairs
    L3_1 = L0_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = L1_1
      L8_1 = L6_1
      L9_1 = "|"
      L1_1 = L7_1 .. L8_1 .. L9_1
    end
    L2_1 = L1_1
    L3_1 = "]"
    L1_1 = L2_1 .. L3_1
    L2_1 = #L0_1
    L2_1 = L0_1[L2_1]
    L3_1 = MpCommon
    L3_1 = L3_1.ExpandEnvironmentVariables
    L4_1 = "%ExchangeInstallPath%"
    L3_1 = L3_1(L4_1)
    if L3_1 ~= nil and L3_1 ~= "" and L3_1 ~= "%ExchangeInstallPath%" then
      L4_1 = string
      L4_1 = L4_1.gsub
      L5_1 = L2_1
      L6_1 = "/"
      L7_1 = "\\"
      L4_1 = L4_1(L5_1, L6_1, L7_1)
      L5_1 = L3_1
      L6_1 = "FrontEnd\\HttpProxy"
      L7_1 = L4_1
      L4_1 = L5_1 .. L6_1 .. L7_1
      L5_1 = bm
      L5_1 = L5_1.add_related_string
      L6_1 = "webshellcandidate"
      L7_1 = L4_1
      L8_1 = bm
      L8_1 = L8_1.RelatedStringBMReport
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = sysio
      L5_1 = L5_1.IsFileExists
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = string
        L5_1 = L5_1.match
        L6_1 = L4_1
        L7_1 = "(.*\\)[^\\]+$"
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 then
          L6_1 = bm
          L6_1 = L6_1.add_related_string
          L7_1 = "webshellpaths"
          L8_1 = L5_1
          L9_1 = bm
          L9_1 = L9_1.RelatedStringBMReport
          L6_1(L7_1, L8_1, L9_1)
        end
        L6_1 = bm
        L6_1 = L6_1.add_threat_file
        L7_1 = L4_1
        L6_1(L7_1)
        L6_1 = mp
        L6_1 = L6_1.ReportLowfi
        L7_1 = L4_1
        L8_1 = 679953091
        L6_1(L7_1, L8_1)
      end
    end
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "uri_list"
    L6_1 = L1_1
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = pcall
    L5_1 = reportBmInfo
    L4_1, L5_1 = L4_1(L5_1)
    if not L4_1 and L5_1 then
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "bmInfoFailReason"
      L8_1 = tostring
      L9_1 = L5_1
      L8_1 = L8_1(L9_1)
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
