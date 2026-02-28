local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "%%(%x%x)"
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = string
    L1_3 = L1_3.char
    L2_3 = tonumber
    L3_3 = A0_3
    L4_3 = 16
    L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
    return L1_3(L2_3, L3_3, L4_3)
  end
  
  return L1_2(L2_2, L3_2, L4_2)
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= "string" then
    L1_2 = false
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "https?://[^/]+(/.+)"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = L2_1
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = string
  L3_2 = L3_2.char
  L4_2 = 27
  L3_2 = L3_2(L4_2)
  L4_2 = string
  L4_2 = L4_2.char
  L5_2 = 7
  L4_2 = L4_2(L5_2)
  L5_2 = L3_2
  L6_2 = "%]0;.-"
  L7_2 = L4_2
  L5_2 = L5_2 .. L6_2 .. L7_2
  L7_2 = L2_2
  L6_2 = L2_2.find
  L8_2 = L5_2
  L9_2 = 1
  L10_2 = false
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = L6_2 ~= nil
  return L6_2
end

L4_1 = L2_1
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = L3_1
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
