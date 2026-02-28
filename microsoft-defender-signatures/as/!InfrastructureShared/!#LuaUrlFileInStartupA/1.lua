local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "^file:///"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "/"
  L5_2 = "\\"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "%%(%x%x)"
  
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = string
    L1_3 = L1_3.char
    L2_3 = tonumber
    L3_3 = A0_3
    L4_3 = 16
    L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
    return L1_3(L2_3, L3_3, L4_3)
  end
  
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  return L1_2
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "^[A-Za-z]:\\[^:*?\"<>|]+$"
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 ~= nil
  return L1_2
end

L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if 4096 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:UrlFileInStartupFileSizeGT0x1000"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = tostring
L4_1 = headerpage
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = #L3_1
  if not (L4_1 < 24) then
    goto lbl_26
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_26::
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "[Uu][Rr][Ll]%s*=%s*\"?(.-)[\r\n'\"]"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= nil then
  L5_1 = #L4_1
  if not (L5_1 <= 3) then
    L5_1 = StringStartsWith
    L6_1 = L4_1
    L7_1 = "http"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      goto lbl_43
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_43::
L5_1 = #L4_1
if 8 < L5_1 then
  L5_1 = StringStartsWith
  L6_1 = L4_1
  L7_1 = "file:///"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = L0_1
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
  end
end
if L4_1 ~= nil then
  L5_1 = #L4_1
  if 2 < L5_1 then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L6_1 = StringEndsWith
    L7_1 = L5_1
    L8_1 = "supervisorprintpopup.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = StringEndsWith
    L7_1 = L5_1
    L8_1 = ".html"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = StringEndsWith
    L7_1 = L5_1
    L8_1 = ".pdf"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = mp
    L6_1 = L6_1.getfilename
    L7_1 = mp
    L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
    L6_1 = L6_1(L7_1)
    if L6_1 ~= nil then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = normalize_path
      L9_1 = L6_1
      L8_1, L9_1, L10_1 = L8_1(L9_1)
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      L6_1 = L7_1
    end
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L4_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "Lua:UrlFileInStartupWithTargetExist.A"
      L7_1(L8_1)
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "MpInternal_researchdata=urlfileinstartuptargetexist="
      L9_1 = L4_1
      L8_1 = L8_1 .. L9_1
      L7_1(L8_1)
      L7_1 = mp
      L7_1 = L7_1.ReportLowfi
      L8_1 = L4_1
      L9_1 = 3186240911
      L7_1(L8_1, L9_1)
      L7_1 = AppendToRollingQueue
      L8_1 = "UrlFileInStartupTargetA"
      L9_1 = L5_1
      L10_1 = L6_1
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = mp
      L7_1 = L7_1.TriggerScanResource
      L8_1 = "file"
      L9_1 = L4_1
      L10_1 = 0
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
    L7_1 = L1_1
    L8_1 = L4_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = AppendToRollingQueue
      L8_1 = "UrlFileInStartupTargetA"
      L9_1 = L5_1
      L10_1 = L6_1
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "Lua:UrlFileInStartupWithTargetNotExist.A"
      L7_1(L8_1)
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "MpInternal_researchdata=urlfileinstartuptargetnotexist="
      L9_1 = L4_1
      L8_1 = L8_1 .. L9_1
      L7_1(L8_1)
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
