local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ""
  L2_2 = ""
  L3_2 = 1
  L4_2 = 1
  while true do
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = A0_2
    L7_2 = "%[char%]%((%d+)%)"
    L8_2 = L4_2
    L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2, L8_2)
    L2_2 = L7_2
    L4_2 = L6_2
    L3_2 = L5_2
    if not L3_2 then
      break
    end
    L5_2 = L1_2
    L6_2 = string
    L6_2 = L6_2.char
    L7_2 = tonumber
    L8_2 = L2_2
    L7_2, L8_2 = L7_2(L8_2)
    L6_2 = L6_2(L7_2, L8_2)
    L1_2 = L5_2 .. L6_2
  end
  return L1_2
end

L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "%[char%]%(%d+%)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = L2_1
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "http"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "start-process"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = contains
      L5_1 = L3_1
      L6_1 = {}
      L7_1 = "-w 1"
      L8_1 = "-w h"
      L9_1 = "hidden"
      L6_1[1] = L7_1
      L6_1[2] = L8_1
      L6_1[3] = L9_1
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
