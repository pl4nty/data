local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
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

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = pairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L8_2 = L5_2
    L7_2 = L5_2.match
    L9_2 = "(.+)/(%d+)"
    L7_2, L8_2 = L7_2(L8_2, L9_2)
    L9_2 = tonumber
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L8_2 = L9_2
    L9_2 = isIPInNetmaskRange
    L10_2 = A0_2
    L11_2 = L7_2
    L12_2 = L8_2
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    if L9_2 then
      L9_2 = true
      return L9_2
    end
  end
  L2_2 = false
  return L2_2
end

L4_1 = "route(?:.exe)?\\s+add\\s+(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\/\\d{1,2})\\s+mask"
L5_1 = "route(?:.exe)?\\s+add\\s+(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})\\s+mask"
L6_1 = MpCommon
L6_1 = L6_1.StringRegExpSearch
L7_1 = L4_1
L8_1 = L1_1
L6_1, L7_1 = L6_1(L7_1, L8_1)
if L6_1 and L7_1 then
  L8_1 = L2_1[L7_1]
  if L8_1 then
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
if not L6_1 then
  L8_1 = MpCommon
  L8_1 = L8_1.StringRegExpSearch
  L9_1 = L5_1
  L10_1 = L1_1
  L8_1, L9_1 = L8_1(L9_1, L10_1)
  if L8_1 and L9_1 then
    L10_1 = L3_1
    L11_1 = L9_1
    L12_1 = L2_1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
