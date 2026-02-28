local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L1_1 = L2_1.utf8p1
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "PFApp_Parent"
L3_1 = MpCommon
L3_1 = L3_1.GetProcessAttributeValue
L4_1 = L0_1
L5_1 = "PFApp_Parent"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.GetProcessAttributeValue
  L4_1 = L0_1
  L5_1 = "inherit:PFApp_Parent"
  L3_1 = L3_1(L4_1, L5_1)
end
if not L3_1 then
  L2_1 = "PFAppTracked"
  L4_1 = MpCommon
  L4_1 = L4_1.GetProcessAttributeValue
  L5_1 = L0_1
  L6_1 = "PFAppTracked"
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1 or L3_1
  if not L4_1 then
    L4_1 = MpCommon
    L4_1 = L4_1.GetProcessAttributeValue
    L5_1 = L0_1
    L6_1 = "inherit:PFAppTracked"
    L4_1 = L4_1(L5_1, L6_1)
    L3_1 = L4_1
  end
end
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[4]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[4]
  L4_1 = L6_1.utf8p2
  L6_1 = this_sigattrlog
  L6_1 = L6_1[4]
  L5_1 = L6_1.utf8p1
end
if not L4_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = nri
L6_1 = L6_1.GetHttpRequestHeader
L7_1 = "User-Agent"
L6_1 = L6_1(L7_1)
if L0_1 then
  L7_1 = {}
  L8_1 = L6_1 or L8_1
  if not L6_1 then
    L8_1 = ""
  end
  L7_1.UserAgent = L8_1
  L8_1 = string
  L8_1 = L8_1.match
  L9_1 = L4_1
  L10_1 = ".(.*)"
  L8_1 = L8_1(L9_1, L10_1)
  L7_1.HostName = L8_1
  L7_1.Url = L5_1
  L7_1.AttributeValue = L3_1
  L7_1.AttributeName = L2_1
  L7_1.ProcessName = L1_1
  L8_1 = nri
  L8_1 = L8_1.GetHttpCommand
  L8_1 = L8_1()
  L7_1.HttpCommand = L8_1
  L8_1 = MpCommon
  L8_1 = L8_1.BmTriggerSig
  L9_1 = L0_1
  L10_1 = "NRI:AppomalyTracked_OutboundHttp"
  L11_1 = safeJsonSerialize
  L12_1 = L7_1
  L11_1, L12_1 = L11_1(L12_1)
  L8_1(L9_1, L10_1, L11_1, L12_1)
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
