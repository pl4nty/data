local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsPowerShellAMSIScan"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ""
L2_1 = L0_1.is_header
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = headerpage
  L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  L1_1 = L2_1
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = footerpage
  L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  L1_1 = L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1["4.149.115.16/28"] = true
L2_1["4.190.130.32/28"] = true
L2_1["4.194.226.160/27"] = true
L2_1["4.208.13.0/24"] = true
L2_1["13.83.125.0/24"] = true
L2_1["20.8.195.0/24"] = true
L2_1["20.10.127.0/24"] = true
L2_1["20.15.141.0/24"] = true
L2_1["20.18.4.160/28"] = true
L2_1["20.19.31.144/28"] = true
L2_1["20.26.63.224/28"] = true
L2_1["20.91.96.64/28"] = true
L2_1["20.91.149.32/28"] = true
L2_1["20.175.2.208/28"] = true
L2_1["20.199.204.160/28"] = true
L2_1["20.204.195.240/28"] = true
L2_1["20.208.150.16/28"] = true
L2_1["20.211.228.80/28"] = true
L2_1["20.220.2.112/28"] = true
L2_1["20.226.211.64/28"] = true
L2_1["20.242.181.0/24"] = true
L2_1["20.254.173.48/28"] = true
L2_1["40.80.103.192/28"] = true
L2_1["52.172.85.0/28"] = true
L2_1["68.218.120.64/28"] = true
L3_1 = "new-netroute.*\\-destinationprefix[\\s\"']+(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\/\\d{1,2})[\\s\"']+"
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = L3_1
L6_1 = L1_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
if L4_1 and L5_1 then
  L6_1 = L2_1[L5_1]
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
