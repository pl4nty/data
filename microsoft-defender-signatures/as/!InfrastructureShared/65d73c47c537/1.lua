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
if L1_1 ~= "" and L1_1 ~= nil then
  L2_1 = #L1_1
  if not (800 < L2_1) then
    goto lbl_25
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_25::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "recaptcha\225\160\142"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "verification"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "robot"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "captcha"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    goto lbl_63
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_63::

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L1_2["\206\191"] = "o"
  L1_2["\213\130"] = "o"
  L1_2["\195\179"] = "o"
  L1_2["\195\182"] = "o"
  L1_2["\208\190"] = "o"
  L1_2["\214\133"] = "o"
  L1_2["\201\190"] = "r"
  L1_2["\208\179"] = "r"
  L1_2["\209\130"] = "t"
  L1_2["\206\164"] = "T"
  L1_2["\206\151"] = "H"
  L1_2["\208\157"] = "H"
  L1_2["\195\163"] = "a"
  L1_2["\208\176"] = "a"
  L1_2["\206\145"] = "A"
  L1_2["\195\132"] = "A"
  L1_2["\195\161"] = "a"
  L1_2["\201\145"] = "a"
  L1_2["\208\144"] = "A"
  L1_2["\195\159"] = "b"
  L1_2["\209\140"] = "b"
  L1_2["\195\167"] = "c"
  L1_2["\208\161"] = "C"
  L1_2["\207\185"] = "C"
  L1_2["\208\160"] = "P"
  L1_2["\206\161"] = "P"
  L1_2["\234\147\178"] = "I"
  L1_2["\234\147\145"] = "p"
  L1_2["\234\147\148"] = "T"
  L1_2["\225\185\173"] = "t"
  L1_2["\225\180\155"] = "t"
  L1_2["\225\160\142"] = ""
  L2_2 = ""
  L3_2 = 1
  while true do
    L4_2 = #A0_2
    if not (L3_2 <= L4_2) then
      break
    end
    L5_2 = A0_2
    L4_2 = A0_2.sub
    L6_2 = L3_2
    L7_2 = L3_2 + 2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = L1_2[L4_2]
    if L5_2 then
      L5_2 = L2_2
      L6_2 = L1_2[L4_2]
      L2_2 = L5_2 .. L6_2
      L5_2 = #L4_2
      L3_2 = L3_2 + L5_2
    else
      L6_2 = A0_2
      L5_2 = A0_2.sub
      L7_2 = L3_2
      L8_2 = L3_2 + 1
      L5_2 = L5_2(L6_2, L7_2, L8_2)
      L6_2 = L1_2[L5_2]
      if L6_2 then
        L6_2 = L2_2
        L7_2 = L1_2[L5_2]
        L2_2 = L6_2 .. L7_2
        L6_2 = #L5_2
        L3_2 = L3_2 + L6_2
      else
        L6_2 = L2_2
        L8_2 = A0_2
        L7_2 = A0_2.sub
        L9_2 = L3_2
        L10_2 = L3_2
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        L2_2 = L6_2 .. L7_2
        L3_2 = L3_2 + 1
      end
    end
  end
  return L2_2
end

L4_1 = L3_1
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L6_1 = L4_1
L5_1 = L4_1.find
L7_1 = "robot"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = "captcha"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    goto lbl_89
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_89::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
