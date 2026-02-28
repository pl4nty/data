local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 271360 < L0_1 and L0_1 <= 2170880 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:PST.Has.ASPXExt.InInterestingA"
  L1_1(L2_1)
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\microsoft\\exchange server\\v%d%d\\frontend\\"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\frontend\\httpproxy\\owa\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\inetpub\\wwwroot\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 == nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "\\microsoft\\exchange server\\v%d%d\\clientaccess\\"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == nil then
        goto lbl_59
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "Lua:PST.SuspPath"
L2_1(L3_1)
::lbl_59::
if L0_1 ~= 271360 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 20480
L4_1 = 65536
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = tostring
L5_1 = L2_1
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "script language="
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "page language="
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "uploadfile"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "eval"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "exec_code"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      goto lbl_132
    end
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:Shell_CVE-2021-31207"
L4_1(L5_1)
goto lbl_194
::lbl_132::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "jscript"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "\"c#\""
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "server"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      goto lbl_194
    end
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:Suspicious.CVE-2021-31207"
L4_1(L5_1)
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "powershell"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "page_load"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "scriptText"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      goto lbl_194
    end
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:PowerShell_CVE-2021-31207"
L4_1(L5_1)
::lbl_194::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
