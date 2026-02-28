local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 3096 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = true
L2_1(L3_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L2_1
L5_1 = "['\"%s]+$"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s#?%s*[%a]:\\.+\\.+%.[%a]+$"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L3_1
  L6_1 = "#%s*[%a]:\\.+\\.+%.[%a]+$"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 or not (L0_1 < 300) then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "%s[%a]:(.*)"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L4_1
L5_1 = L4_1.find
L7_1 = "[:<>]"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L3_1
L7_1 = "h.?.?.?.?.?.?t.?.?.?.?.?.?t.?.?.?.?.?.?p.?.?.?.?.?.?s?.?.?.?.?.?.?:.?.?.?.?.?.?/"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L3_1
  L7_1 = " ping "
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L4_1
L7_1 = "%.pdf$"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L4_1
  L7_1 = "%.xlsx$"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L4_1
    L7_1 = "%.docx$"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = L4_1
      L7_1 = "%.pptx$"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        goto lbl_131
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_131::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
