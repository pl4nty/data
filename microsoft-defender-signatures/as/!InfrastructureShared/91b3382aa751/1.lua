local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L0_1
L4_1 = L4_1(L5_1)
L5_1 = L4_1
L4_1 = L4_1.match
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
L1_1 = L4_1
if not L1_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L1_1 == "w3wp.exe" then
  L4_1 = bm
  L4_1 = L4_1.get_current_process_startup_info
  L4_1 = L4_1()
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1.command_line
  L5_1 = L5_1(L6_1)
  L6_1 = L5_1
  L5_1 = L5_1.match
  L7_1 = "-ap \"([^\"]+)\""
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == nil then
    L2_1 = "nil"
  else
    L2_1 = L5_1
  end
  L3_1 = true
end
L4_1 = nil
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[7]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[7]
  L4_1 = L6_1.utf8p2
end
if L4_1 ~= nil then
  L6_1 = string
  L6_1 = L6_1.format
  L7_1 = "%s;%s;%s"
  L8_1 = L1_1
  L9_1 = L2_1
  L10_1 = L4_1
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  L5_1 = L6_1
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "ExchgCompromise"
  L8_1 = L5_1
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = bm
  L6_1 = L6_1.set_detection_string
  L7_1 = L5_1
  L6_1(L7_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = nil
L7_1 = "\\.(asp|aspx|ashx|asmx)$"
L8_1 = mp
L8_1 = L8_1.SIGATTR_LOG_SZ
L9_1 = 1
L10_1 = -1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = sigattr_tail
  L12_1 = L12_1[L11_1]
  L13_1 = L12_1.matched
  if L13_1 then
    L13_1 = L12_1.attribute
    if L13_1 ~= 16384 then
      L13_1 = L12_1.attribute
      if L13_1 ~= 16385 then
        goto lbl_114
      end
    end
    L13_1 = L12_1.utf8p1
    if L13_1 then
      L13_1 = string
      L13_1 = L13_1.lower
      L14_1 = L12_1.utf8p1
      L13_1 = L13_1(L14_1)
      L14_1 = L13_1
      L13_1 = L13_1.match
      L15_1 = "(\\[^\\]+\\[^\\]+)$"
      L13_1 = L13_1(L14_1, L15_1)
      L6_1 = L13_1
      L13_1 = MpCommon
      L13_1 = L13_1.StringRegExpSearch
      L14_1 = L7_1
      L15_1 = L6_1
      L13_1, L14_1 = L13_1(L14_1, L15_1)
      if L13_1 then
        break
      end
    end
  end
  ::lbl_114::
end
if not L6_1 then
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "FileExtractErr"
  L10_1 = "true"
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
if L3_1 then
  L8_1 = string
  L8_1 = L8_1.format
  L9_1 = "%s;%s;%s"
  L10_1 = L1_1
  L11_1 = L2_1
  L12_1 = L6_1
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  L5_1 = L8_1
else
  L8_1 = string
  L8_1 = L8_1.format
  L9_1 = "%s;%s"
  L10_1 = L1_1
  L11_1 = L6_1
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  L5_1 = L8_1
end
L8_1 = bm
L8_1 = L8_1.add_related_string
L9_1 = "ExchgCompromise"
L10_1 = L5_1
L11_1 = bm
L11_1 = L11_1.RelatedStringBMReport
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
