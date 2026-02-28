local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILENAME
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1 = L1_1(L2_1)
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
      goto lbl_30
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_30::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L1_1
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L4_1 = L2_1
L3_1 = L2_1.gsub
L5_1 = "\\\\%?\\"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.lower
L4_1 = MpCommon
L4_1 = L4_1.ExpandEnvironmentVariables
L5_1 = "%windir%"
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L2_1 ~= nil and L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.len
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not (L4_1 < 2) then
    goto lbl_62
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_62::
L4_1 = string
L4_1 = L4_1.len
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.len
L6_1 = L2_1
L5_1 = L5_1(L6_1)
if L4_1 < L5_1 then
  L5_1 = string
  L5_1 = L5_1.sub
  L6_1 = L2_1
  L7_1 = 0
  L8_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 == L3_1 then
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L2_1
    L7_1 = L3_1
    L8_1 = "(\\.-\\)"
    L7_1 = L7_1 .. L8_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.len
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if 2 < L6_1 then
        L6_1 = {}
        L6_1["\\microsoft.net\\"] = true
        L6_1["\\assembly\\"] = true
        L7_1 = L6_1[L5_1]
        if L7_1 then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
      end
    end
  end
end
L5_1 = pe
L5_1 = L5_1.get_versioninfo
L5_1 = L5_1()
if L5_1 ~= nil then
  L6_1 = L5_1.OriginalFilename
  if L6_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1.OriginalFilename
    L6_1 = L6_1(L7_1)
    if L6_1 == "microsoft.workflow.compiler.exe" then
      goto lbl_125
    end
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "Lua:MsWorkFlowCompilerContext.A!invalidversioninfo"
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_125::
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L5_1.OriginalFilename
L6_1 = L6_1(L7_1)
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L0_1
L7_1 = L7_1(L8_1)
if L7_1 == L6_1 then
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:MsWorkFlowCompilerContext.A!legitfilename"
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "Lua:MsWorkFlowCompilerContext.A!suspiciousfilename"
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
