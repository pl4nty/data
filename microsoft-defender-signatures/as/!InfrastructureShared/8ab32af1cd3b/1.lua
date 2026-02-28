local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = 0
L1_1 = 1
L2_1 = mp
L2_1 = L2_1.SIGATTR_LOG_SZ
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = sigattr_head
  L5_1 = L5_1[L4_1]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = sigattr_head
    L5_1 = L5_1[L4_1]
    L5_1 = L5_1.attribute
    if L5_1 == 16384 then
      L0_1 = L0_1 + 1
    end
  end
end
if 1 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = L1_1.integrity_level
L3_1 = MpCommon
L3_1 = L3_1.SECURITY_MANDATORY_MEDIUM_RID
if L2_1 <= L3_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.utf8p1
if L2_1 ~= nil then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    goto lbl_48
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_48::
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.utf8p2
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.utf8p1
if not L2_1 or not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "/"
  L4_2 = "\\"
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "^\"%s*"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "%s*\"$"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "\\+"
  L4_2 = "\\"
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  L1_2 = #A0_2
  if 3 < L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.gsub
    L3_2 = "\\+$"
    L4_2 = ""
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    A0_2 = L1_2
  end
  return A0_2
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "%-o\"([^\"]+)\""
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.match
    L3_2 = "%-o([^%s]+)"
    L1_2 = L1_2(L2_2, L3_2)
  end
  if L1_2 then
    L2_2 = L4_1
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = nil
  ::lbl_17::
  return L2_2
end

L6_1 = L5_1
L7_1 = L2_1
L6_1 = L6_1(L7_1)
L7_1 = L4_1
L8_1 = L3_1
L7_1 = L7_1(L8_1)
if not L6_1 or not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L9_1 = L6_1
L8_1 = L6_1.sub
L10_1 = -1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 ~= "\\" then
  L8_1 = L6_1
  L9_1 = "\\"
  L6_1 = L8_1 .. L9_1
end
L9_1 = L7_1
L8_1 = L7_1.sub
L10_1 = 1
L11_1 = #L6_1
L8_1 = L8_1(L9_1, L10_1, L11_1)
if L8_1 ~= L6_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
