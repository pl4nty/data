local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= "explorer.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "ClickFix_PS_Explorer_parent"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = #L3_1
if L4_1 < 50 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = #L3_1
if 450 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "ClickFix_PS_cmdline_lt450"
L4_1(L5_1)
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = "(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+"
L6_1 = L3_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "ClickFix_PS_found_hidden"
L6_1(L7_1)
L6_1 = {}
L7_1 = "iwr"
L8_1 = "iex"
L9_1 = "irm"
L10_1 = "curl"
L11_1 = "bitsadmin"
L12_1 = "e%:jscript"
L13_1 = "downloadstring"
L14_1 = "invoke%-restmethod"
L15_1 = "invoke%-webrequest"
L16_1 = "invoke%-expression"
L17_1 = "start%-process"
L18_1 = "%[scriptblock%]%:%:create"
L19_1 = "new%-object"
L20_1 = "web%.client"
L21_1 = "-usebasicparsing"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L6_1[5] = L11_1
L6_1[6] = L12_1
L6_1[7] = L13_1
L6_1[8] = L14_1
L6_1[9] = L15_1
L6_1[10] = L16_1
L6_1[11] = L17_1
L6_1[12] = L18_1
L6_1[13] = L19_1
L6_1[14] = L20_1
L6_1[15] = L21_1
L7_1 = 0
L8_1 = 0
L9_1 = 0
L10_1 = 0
L11_1 = 0
L12_1 = 0
L14_1 = L3_1
L13_1 = L3_1.gsub
L15_1 = "\"(.-)\""

function L16_1()
  local L0_2, L1_2
  L0_2 = L7_1
  L0_2 = L0_2 + 1
  L7_1 = L0_2
end

L13_1(L14_1, L15_1, L16_1)
L14_1 = L3_1
L13_1 = L3_1.gsub
L15_1 = "'(.-)'"

function L16_1()
  local L0_2, L1_2
  L0_2 = L8_1
  L0_2 = L0_2 + 1
  L8_1 = L0_2
end

L13_1(L14_1, L15_1, L16_1)
L13_1 = select
L14_1 = 2
L16_1 = L3_1
L15_1 = L3_1.gsub
L17_1 = "`"
L18_1 = ""
L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1, L17_1, L18_1)
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L9_1 = L13_1
L13_1 = select
L14_1 = 2
L16_1 = L3_1
L15_1 = L3_1.gsub
L17_1 = "%^"
L18_1 = ""
L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1, L17_1, L18_1)
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L12_1 = L13_1
L13_1 = select
L14_1 = 2
L16_1 = L3_1
L15_1 = L3_1.gsub
L17_1 = "([\"'][^\"']-[\"'])[\"']"
L18_1 = ""
L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1, L17_1, L18_1)
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L10_1 = L13_1
L13_1 = select
L14_1 = 2
L16_1 = L3_1
L15_1 = L3_1.gsub
L17_1 = "[\"'].-[\"']%s*%+%s*[\"']"
L18_1 = ""
L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1, L17_1, L18_1)
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L11_1 = L13_1
L13_1 = L7_1 * 1
L14_1 = L8_1 * 1
L13_1 = L13_1 + L14_1
L14_1 = L9_1 * 2
L13_1 = L13_1 + L14_1
L14_1 = L10_1 * 2
L13_1 = L13_1 + L14_1
L14_1 = L11_1 * 2
L13_1 = L13_1 + L14_1
L14_1 = L12_1 * 2
L13_1 = L13_1 + L14_1
L14_1 = 10
if not (L13_1 >= L14_1) then
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
L15_1 = mp
L15_1 = L15_1.set_mpattribute
L16_1 = "ClickFix_PS_total_obfuscation_signals_gt10"
L15_1(L16_1)
L15_1 = string
L15_1 = L15_1.gsub
L16_1 = L3_1
L17_1 = "[\"'`^()+#&]"
L18_1 = ""
L15_1 = L15_1(L16_1, L17_1, L18_1)
L16_1 = string
L16_1 = L16_1.gsub
L17_1 = L15_1
L18_1 = "%s"
L19_1 = ""
L16_1 = L16_1(L17_1, L18_1, L19_1)
L15_1 = L16_1
L16_1 = string
L16_1 = L16_1.lower
L17_1 = L15_1
L16_1 = L16_1(L17_1)
L15_1 = L16_1
L16_1 = str_count_match
L17_1 = L15_1
L18_1 = L6_1
L16_1 = L16_1(L17_1, L18_1)
if 2 <= L16_1 then
  L17_1 = mp
  L17_1 = L17_1.set_mpattribute
  L18_1 = "ClickFix_PS_susp_string_gt2"
  L17_1(L18_1)
  L17_1 = mp
  L17_1 = L17_1.INFECTED
  return L17_1
end
L17_1 = mp
L17_1 = L17_1.CLEAN
return L17_1
