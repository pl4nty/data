local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 10) then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    L3_1 = -9
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == "\\system32" then
      goto lbl_27
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_27::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 < 5) then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = -4
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == ".exe" then
      goto lbl_53
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_53::
L2_1 = {}
L3_1 = {}
L3_1["sethc.exe"] = true
L3_1.sethc = true
L2_1["sethc.exe"] = L3_1
L3_1 = {}
L3_1["utilman.exe"] = true
L3_1["utilman2.exe"] = true
L3_1.utilman = true
L2_1["utilman.exe"] = L3_1
L3_1 = {}
L3_1["osk.exe"] = true
L3_1.osk = true
L2_1["osk.exe"] = L3_1
L3_1 = {}
L3_1["screenmagnifier.exe"] = true
L3_1["magnify.exe"] = true
L3_1.magnifier = true
L2_1["magnify.exe"] = L3_1
L3_1 = {}
L3_1["narrator.exe"] = true
L3_1["sr.exe"] = true
L3_1.narrator = true
L2_1["narrator.exe"] = L3_1
L3_1 = {}
L3_1["displayswitch.exe"] = true
L3_1.displayswitch = true
L2_1["displayswitch.exe"] = L3_1
L3_1 = {}
L3_1["atbroker.exe"] = true
L2_1["atbroker.exe"] = L3_1
L3_1 = L2_1[L1_1]
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L0_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L0_1 = L3_1
L4_1 = L0_1
L3_1 = L0_1.gsub
L5_1 = "\\\\%?\\"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L0_1 = L3_1
L3_1 = string
L3_1 = L3_1.lower
L4_1 = MpCommon
L4_1 = L4_1.ExpandEnvironmentVariables
L5_1 = "%windir%"
L4_1 = L4_1(L5_1)
L5_1 = "\\system32"
L4_1 = L4_1 .. L5_1
L3_1 = L3_1(L4_1)
if L0_1 ~= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = pe
L4_1 = L4_1.get_versioninfo
L4_1 = L4_1()
if L4_1 ~= nil then
  L5_1 = L4_1.OriginalFilename
  if L5_1 ~= nil then
    L5_1 = L4_1.InternalName
    if L5_1 ~= nil then
      L5_1 = L4_1.CompanyName
      if L5_1 ~= nil then
        goto lbl_138
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "Lua:AccessibilityEscalationContext.B!noversioninfo"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_138::
L5_1 = false
L6_1 = L0_1
L7_1 = "\\"
L8_1 = L1_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = mp
L7_1 = L7_1.IsTrustedFile
L8_1 = false
L7_1 = L7_1(L8_1)
L7_1 = mp
L7_1 = L7_1.IsKnownFriendlyFile
L8_1 = L6_1
L9_1 = true
L10_1 = false
L7_1 = L7_1 == true or L7_1
if L7_1 == true then
  L5_1 = true
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L4_1.CompanyName
L7_1 = L7_1(L8_1)
L8_1 = string
L8_1 = L8_1.lower
L9_1 = L4_1.OriginalFilename
L8_1 = L8_1(L9_1)
L9_1 = string
L9_1 = L9_1.lower
L10_1 = L4_1.InternalName
L9_1 = L9_1(L10_1)
L10_1 = L2_1[L1_1]
L10_1 = L10_1[L8_1]
if L10_1 ~= nil then
  L10_1 = L2_1[L1_1]
  L10_1 = L10_1[L9_1]
  if L10_1 ~= nil and L7_1 == "microsoft corporation" then
    if not L5_1 then
      L10_1 = mp
      L10_1 = L10_1.set_mpattribute
      L11_1 = "Lua:AccessibilityEscalationContext.B!mimick"
      L10_1(L11_1)
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
end
L10_1 = L2_1[L1_1]
L10_1 = L10_1[L8_1]
if L10_1 == nil then
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:AccessibilityEscalationContext.B!originalfname_nomatch"
  L10_1(L11_1)
end
L10_1 = L2_1[L1_1]
L10_1 = L10_1[L9_1]
if L10_1 == nil then
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:AccessibilityEscalationContext.B!internalname_nomatch"
  L10_1(L11_1)
end
if L7_1 ~= "microsoft corporation" then
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:AccessibilityEscalationContext.B!company_nomatch"
  L10_1(L11_1)
end
if L5_1 then
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:AccessibilityEscalationContext.B!friendly"
  L10_1(L11_1)
else
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:AccessibilityEscalationContext.B!unfriendly"
  L10_1(L11_1)
end
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
