local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = #L3_1
  if not (L4_1 <= 10) then
    goto lbl_21
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_21::
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "or8ixLi90Mf%s+\"?%s*([A-Za-z0-9/%+=]+)"
L4_1 = L4_1(L5_1, L6_1)
L1_1 = L4_1
if L1_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.Base64Decode
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L0_1 = L4_1
if L0_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L0_1
L4_1 = L0_1.lower
L4_1 = L4_1(L5_1)
L0_1 = L4_1
L4_1 = {}
L5_1 = ":\\\\programdata\\dell"
L6_1 = ":\\\\programdata\\hp"
L7_1 = ":\\\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
L8_1 = ":\\\\perflogs"
L9_1 = ":\\\\windows\\\\help"
L10_1 = ":\\\\windows\\\\debug"
L11_1 = ":\\\\windows\\\\tapi"
L12_1 = ":\\\\windows\\\\temp"
L13_1 = ":\\\\intel"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L5_1 = {}
L6_1 = ":\\\\programdata$"
L5_1[1] = L6_1
L6_1 = string
L6_1 = L6_1.match
L7_1 = L0_1
L8_1 = "\"command\":\"(%w+)\","
L6_1 = L6_1(L7_1, L8_1)
L7_1 = string
L7_1 = L7_1.match
L8_1 = L0_1
L9_1 = "\"path\":\"computer\\\\(.*)\",\"name\""
L7_1 = L7_1(L8_1, L9_1)
if L6_1 == nil or L6_1 == "" then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L7_1 == nil or L7_1 == "" then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = contains
L9_1 = L6_1
L10_1 = {}
L11_1 = "upload"
L12_1 = "download"
L10_1[1] = L11_1
L10_1[2] = L12_1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L8_1 = contains
  L9_1 = L7_1
  L10_1 = L4_1
  L8_1 = L8_1(L9_1, L10_1)
  if not L8_1 then
    L8_1 = contains
    L9_1 = L7_1
    L10_1 = L5_1
    L11_1 = false
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    if not L8_1 then
      goto lbl_113
    end
  end
  L8_1 = set_research_data
  L9_1 = "atera_susp"
  L10_1 = L0_1
  L11_1 = false
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
::lbl_113::
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
