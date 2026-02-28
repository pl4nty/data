local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILEPATH
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 < 3) and L0_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.len
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    if not (L2_1 < 5) then
      goto lbl_39
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_39::
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "\\\\%?\\"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.lower
L3_1 = MpCommon
L3_1 = L3_1.ExpandEnvironmentVariables
L4_1 = "%windir%"
L3_1 = L3_1(L4_1)
L4_1 = "\\system32"
L3_1 = L3_1 .. L4_1
L2_1 = L2_1(L3_1)
if L1_1 ~= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1["sethc.exe"] = "sethc"
L3_1["utilman.exe"] = "utilman"
L3_1["osk.exe"] = "osk"
L3_1["magnify.exe"] = "magnify"
L3_1["narrator.exe"] = "narrator"
L3_1["displayswitch.exe"] = "displayswitch"
L3_1["atbroker.exe"] = "atbroker"
L4_1 = L3_1[L0_1]
if L4_1 ~= nil then
  L4_1 = L3_1[L0_1]
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:AccessibilityEscalationContext.A!"
  L7_1 = L4_1
  L6_1 = L6_1 .. L7_1
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
