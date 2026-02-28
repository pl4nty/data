local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = 8192
L1_1 = 131072
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L0_1 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "BM_SUSP_ESP_TXT_FILE"
  L3_1(L4_1)
end
if L1_1 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = 0
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = true
L4_1(L5_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L3_1
L6_1 = "rmmod "
L7_1 = ""
L8_1 = 5
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not (5 < L5_1) then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = ";.-do.-rmmod .-done"
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    goto lbl_60
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "SuspTxtWithRmmodCmds"
L6_1(L7_1)
::lbl_60::
L6_1 = string
L6_1 = L6_1.find
L7_1 = L3_1
L8_1 = "acpi .-%.aml"
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = "efivar_ssdt="
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    goto lbl_80
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "SuspTxtWithAcpiCmd"
L6_1(L7_1)
::lbl_80::
L6_1 = string
L6_1 = L6_1.len
L7_1 = L3_1
L6_1 = L6_1(L7_1)
if L0_1 > L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = 15000
L7_1 = 0
L8_1 = 0
L9_1 = 0
L10_1 = "MpUefiGrubCheck"
L11_1 = "MpUefiSuspTxt"
L13_1 = L3_1
L12_1 = L3_1.find
L14_1 = "\n"
L15_1 = 1
L16_1 = true
L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
L8_1 = L13_1
L7_1 = L12_1
if L7_1 and L0_1 < L7_1 then
  L12_1 = mp
  L12_1 = L12_1.getfilename
  L13_1 = mp
  L13_1 = L13_1.bitor
  L14_1 = mp
  L14_1 = L14_1.FILEPATH_QUERY_FNAME
  L15_1 = mp
  L15_1 = L15_1.FILEPATH_QUERY_LOWERCASE
  L13_1, L14_1, L15_1, L16_1 = L13_1(L14_1, L15_1)
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
  if L12_1 ~= "grub.cfg" then
    L13_1 = MpCommon
    L13_1 = L13_1.AppendPersistContextNoPath
    L14_1 = L10_1
    L15_1 = L11_1
    L16_1 = 60
    L13_1(L14_1, L15_1, L16_1)
  end
  L13_1 = mp
  L13_1 = L13_1.INFECTED
  return L13_1
end
while L6_1 > L9_1 do
  L13_1 = L3_1
  L12_1 = L3_1.find
  L14_1 = [[
%b

]]
  L15_1 = L7_1 + 1
  L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
  L8_1 = L13_1
  L7_1 = L12_1
  if not L7_1 then
    break
  end
  L9_1 = L9_1 + 1
  L12_1 = L8_1 - L7_1
  if L0_1 < L12_1 then
    L12_1 = mp
    L12_1 = L12_1.getfilename
    L13_1 = mp
    L13_1 = L13_1.bitor
    L14_1 = mp
    L14_1 = L14_1.FILEPATH_QUERY_FNAME
    L15_1 = mp
    L15_1 = L15_1.FILEPATH_QUERY_LOWERCASE
    L13_1, L14_1, L15_1, L16_1 = L13_1(L14_1, L15_1)
    L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
    if L12_1 ~= "grub.cfg" then
      L13_1 = MpCommon
      L13_1 = L13_1.AppendPersistContextNoPath
      L14_1 = L10_1
      L15_1 = L11_1
      L16_1 = 60
      L13_1(L14_1, L15_1, L16_1)
    end
    L13_1 = mp
    L13_1 = L13_1.INFECTED
    return L13_1
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
