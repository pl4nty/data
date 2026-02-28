local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[20]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[20]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[20]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[21]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[21]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[21]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[22]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[22]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[22]
        L0_1 = L1_1.utf8p2
      end
    end
  end
end
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = false
L2_1 = IsKeyInRollingQueue
L3_1 = "enum_script_attributes"
L4_1 = L0_1
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = GetRollingQueueAsHashTable
  L3_1 = "enum_script_attributes"
  L2_1 = L2_1(L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = StringSplit
  L4_1 = L2_1[L0_1]
  L5_1 = "|"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == nil then
    L4_1 = #L3_1
    if not (0 < L4_1) then
      goto lbl_88
    end
  end
  L4_1 = 1
  L5_1 = #L3_1
  L6_1 = 1
  for L7_1 = L4_1, L5_1, L6_1 do
    L8_1 = "BM_ContentAttribs:"
    L9_1 = L3_1[L7_1]
    L8_1 = L8_1 .. L9_1
    L9_1 = bm
    L9_1 = L9_1.trigger_sig
    L10_1 = L8_1
    L11_1 = L0_1
    L9_1(L10_1, L11_1)
  end
  L1_1 = true
end
::lbl_88::
L2_1 = IsKeyInRollingQueue
L3_1 = "enum_bm_attributes"
L4_1 = L0_1
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = GetRollingQueueAsHashTable
  L3_1 = "enum_bm_attributes"
  L2_1 = L2_1(L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = StringSplit
  L4_1 = L2_1[L0_1]
  L5_1 = "|"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == nil then
    L4_1 = #L3_1
    if not (0 < L4_1) then
      goto lbl_126
    end
  end
  L4_1 = 1
  L5_1 = #L3_1
  L6_1 = 1
  for L7_1 = L4_1, L5_1, L6_1 do
    L8_1 = "BM_ContentAttribs:"
    L9_1 = L3_1[L7_1]
    L8_1 = L8_1 .. L9_1
    L9_1 = bm
    L9_1 = L9_1.trigger_sig
    L10_1 = L8_1
    L11_1 = L0_1
    L9_1(L10_1, L11_1)
  end
  L1_1 = true
end
::lbl_126::
if L1_1 == false then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
