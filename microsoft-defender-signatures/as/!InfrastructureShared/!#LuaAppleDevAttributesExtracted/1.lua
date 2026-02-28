local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = "Apple Development: .+ %((.+)%)$"
  L3_2 = "Apple Distribution: .+ %((.+)%)$"
  L4_2 = "Mac Installer Distribution: .+ %((.+)%)$"
  L5_2 = "Developer ID Application: .+ %((.+)%)$"
  L6_2 = "Developer ID Installer: .+ %((.+)%)$"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.match
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      return L7_2
    end
  end
  L2_2 = nil
  return L2_2
end

function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = mp
  L0_2 = L0_2.GetCertificateInfo
  L0_2 = L0_2()
  L1_2 = #L0_2
  if L1_2 < 1 or L0_2 == nil then
    L1_2 = nil
    L2_2 = nil
    return L1_2, L2_2
  end
  L1_2 = nil
  L2_2 = nil
  L3_2 = pairs
  L4_2 = L0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = pairs
    L9_2 = L7_2.Certificates
    L8_2, L9_2, L10_2 = L8_2(L9_2)
    for L11_2, L12_2 in L8_2, L9_2, L10_2 do
      L13_2 = L12_2.SubjectUtf8
      if L13_2 ~= nil then
        L13_2 = L12_2.SubjectUtf8
        L14_2 = L13_2.CommonName
        if L14_2 ~= nil then
          L14_2 = L0_1
          L15_2 = L13_2.CommonName
          L14_2 = L14_2(L15_2)
          L2_2 = L14_2
        end
        if L2_2 ~= nil then
          L1_2 = L13_2.OrganizationUnit
          L14_2 = L2_2
          L15_2 = L1_2
          return L14_2, L15_2
        end
      end
    end
  end
end

L2_1 = "Lua:MacOS_X/AppleDeveloperID_"
L3_1 = "Lua:MacOS_X/AppleTeamID_"
L4_1 = mp
L4_1 = L4_1.get_mpattributesubstring
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.get_mpattributesubstring
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "Lua:AppleDevAttributesExtracted"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      goto lbl_27
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_27::
L4_1 = L1_1
L4_1, L5_1 = L4_1()
if L4_1 == nil and L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = #L4_1
if L6_1 == 10 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = L2_1
  L8_1 = L4_1
  L7_1 = L7_1 .. L8_1
  L6_1(L7_1)
end
L6_1 = #L5_1
if L6_1 == 10 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = L3_1
  L8_1 = L5_1
  L7_1 = L7_1 .. L8_1
  L6_1(L7_1)
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
