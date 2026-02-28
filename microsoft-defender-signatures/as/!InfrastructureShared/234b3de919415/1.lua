local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = 60
L1_1 = {}
L2_1 = {}
L3_1 = {}

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 ~= nil then
    L1_2 = L1_1
    if L1_2 ~= nil then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = ipairs
  L2_2 = L1_1
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    if L5_2 == A0_2 then
      return
    end
  end
  L1_2 = table
  L1_2 = L1_2.insert
  L2_2 = L1_1
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = MpCommon
  L1_2 = L1_2.SetPersistContextNoPath
  L2_2 = "createdFiles_set_redline"
  L3_2 = L1_1
  L4_2 = L0_1
  L1_2(L2_2, L3_2, L4_2)
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 0
  L2_2 = L1_1
  if L2_2 ~= nil and A0_2 ~= nil then
    L2_2 = L2_1
    if L2_2 ~= nil then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L2_2 = ipairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 == A0_2 then
      L1_2 = 1
      break
    end
  end
  if L1_2 == 0 then
    return
  end
  L2_2 = ipairs
  L3_2 = L2_1
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 == A0_2 then
      return
    end
  end
  L2_2 = table
  L2_2 = L2_2.insert
  L3_2 = L2_1
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = MpCommon
  L2_2 = L2_2.SetPersistContextNoPath
  L3_2 = "procCreated_set_redline"
  L4_2 = L2_1
  L5_2 = L0_1
  L2_2(L3_2, L4_2, L5_2)
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L2_1
  if L1_2 ~= nil and A0_2 ~= nil then
    L1_2 = L3_1
    if L1_2 ~= nil then
      goto lbl_11
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_11::
  L1_2 = ipairs
  L2_2 = L3_1
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    if L5_2 == A0_2 then
      L6_2 = false
      return L6_2
    end
  end
  L1_2 = ipairs
  L2_2 = L2_1
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L5_2
    L8_2 = A0_2
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = table
      L6_2 = L6_2.insert
      L7_2 = L3_1
      L8_2 = A0_2
      L6_2(L7_2, L8_2)
      L6_2 = L3_1
      L6_2 = #L6_2
      if 2 <= L6_2 then
        L6_2 = true
        return L6_2
      end
      L6_2 = MpCommon
      L6_2 = L6_2.SetPersistContextNoPath
      L7_2 = "procInj_set_redline"
      L8_2 = L3_1
      L9_2 = L0_1
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = false
      return L6_2
    end
  end
  L1_2 = false
  return L1_2
end

L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextNoPath
L8_1 = "createdFiles_set_redline"
L7_1 = L7_1(L8_1)
if L7_1 ~= nil then
  L7_1 = MpCommon
  L7_1 = L7_1.GetPersistContextNoPath
  L8_1 = "createdFiles_set_redline"
  L7_1 = L7_1(L8_1)
  L1_1 = L7_1
end
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextNoPath
L8_1 = "procCreated_set_redline"
L7_1 = L7_1(L8_1)
if L7_1 ~= nil then
  L7_1 = MpCommon
  L7_1 = L7_1.GetPersistContextNoPath
  L8_1 = "procCreated_set_redline"
  L7_1 = L7_1(L8_1)
  L2_1 = L7_1
end
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextNoPath
L8_1 = "procInj_set_redline"
L7_1 = L7_1(L8_1)
if L7_1 ~= nil then
  L7_1 = MpCommon
  L7_1 = L7_1.GetPersistContextNoPath
  L8_1 = "procInj_set_redline"
  L7_1 = L7_1(L8_1)
  L3_1 = L7_1
end
L7_1 = this_sigattrlog
L7_1 = L7_1[4]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[4]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = L4_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[4]
    L9_1 = L9_1.utf8p1
    L8_1, L9_1, L10_1 = L8_1(L9_1)
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = this_sigattrlog
L7_1 = L7_1[5]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[5]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = L4_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[5]
    L9_1 = L9_1.utf8p1
    L8_1, L9_1, L10_1 = L8_1(L9_1)
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = this_sigattrlog
L7_1 = L7_1[6]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[6]
  L7_1 = L7_1.utf8p2
  if L7_1 ~= nil then
    L7_1 = L4_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[6]
    L9_1 = L9_1.utf8p2
    L8_1, L9_1, L10_1 = L8_1(L9_1)
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = this_sigattrlog
L7_1 = L7_1[7]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[7]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = L5_1
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[7]
    L9_1 = L9_1.utf8p1
    L8_1, L9_1, L10_1 = L8_1(L9_1)
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = this_sigattrlog
L7_1 = L7_1[9]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[9]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = L6_1
    L8_1 = "\\"
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = this_sigattrlog
    L10_1 = L10_1[9]
    L10_1 = L10_1.utf8p1
    L9_1 = L9_1(L10_1)
    L8_1 = L8_1 .. L9_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
