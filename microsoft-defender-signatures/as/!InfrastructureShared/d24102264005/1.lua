local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = nri
L2_1 = L2_1.GetRawRequestBlob
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "%rsp%:Arguments%>%s*([A-Za-z0-9/%+=]+)"
L3_1 = L3_1(L4_1, L5_1)
L0_1 = L3_1
if L0_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.Base64Decode
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
if L1_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "TargetTypeForDeserialization"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "system:Convert.FromBase64String"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "TVqQAAMAAAAE"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = reportHeaders
        L4_1 = {}
        L5_1 = "Host"
        L6_1 = "User-Agent"
        L4_1[1] = L5_1
        L4_1[2] = L6_1
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
