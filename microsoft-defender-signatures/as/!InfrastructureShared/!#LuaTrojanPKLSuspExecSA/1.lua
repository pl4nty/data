local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L1_1 = false
L2_1 = nil
L3_1 = mp
L3_1 = L3_1.getfilename
L3_1 = L3_1()
L4_1 = {}
L5_1 = "\\jedi\\"
L6_1 = "CPython-"
L7_1 = ":\\Program Files"
L8_1 = "\\search-structural\\pycode\\"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L5_1 = contains
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.HEADERPAGE_SZ
if L5_1 < 256 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = tostring
L6_1 = headerpage
L5_1 = L5_1(L6_1)
L0_1 = L5_1
if L0_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "webbrowser"
L7_1 = "httplib"
L8_1 = "requests.api"
L9_1 = "aiohttp.client"
L10_1 = "socket"
L11_1 = "subprocess"
L12_1 = "/bin/bash"
L13_1 = "runpy"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L6_1 = {}
L7_1 = "os.system"
L8_1 = "nt.system"
L9_1 = "os.environ"
L10_1 = "nt.environ"
L11_1 = "posix.system"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L6_1[5] = L11_1
L7_1 = contains
L8_1 = L0_1
L9_1 = {}
L10_1 = "__builtin__"
L11_1 = "builtins"
L9_1[1] = L10_1
L9_1[2] = L11_1
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = contains
  L8_1 = L0_1
  L9_1 = {}
  L10_1 = "eval"
  L11_1 = "exec"
  L12_1 = "compile"
  L13_1 = "getattr"
  L14_1 = "apply"
  L15_1 = "breakpoint"
  L16_1 = "open"
  L9_1[1] = L10_1
  L9_1[2] = L11_1
  L9_1[3] = L12_1
  L9_1[4] = L13_1
  L9_1[5] = L14_1
  L9_1[6] = L15_1
  L9_1[7] = L16_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L1_1 = true
    L2_1 = "evel_exec"
  end
else
  L7_1 = contains
  L8_1 = L0_1
  L9_1 = L6_1
  L10_1 = false
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  if L7_1 then
    L1_1 = true
    L2_1 = "syetem_environ"
  else
    L7_1 = contains
    L8_1 = L0_1
    L9_1 = L5_1
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L1_1 = true
      L2_1 = "SuspKeyword"
    end
  end
end
if L1_1 and L2_1 then
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = "Lua:PKL_Protocol_V2"
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:PKL_Protocol_V2_suspicious_"
    L9_1 = L2_1
    L8_1 = L8_1 .. L9_1
    L7_1(L8_1)
  else
    L7_1 = mp
    L7_1 = L7_1.get_mpattribute
    L8_1 = "Lua:PKL_Protocol_V3"
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "Lua:PKL_Protocol_V3_suspicious_"
      L9_1 = L2_1
      L8_1 = L8_1 .. L9_1
      L7_1(L8_1)
    else
      L7_1 = mp
      L7_1 = L7_1.get_mpattribute
      L8_1 = "Lua:PKL_Protocol_V4"
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L7_1 = mp
        L7_1 = L7_1.set_mpattribute
        L8_1 = "Lua:PKL_Protocol_V4_suspicious_"
        L9_1 = L2_1
        L8_1 = L8_1 .. L9_1
        L7_1(L8_1)
      else
        L7_1 = mp
        L7_1 = L7_1.get_mpattribute
        L8_1 = "Lua:PKL_Protocol_V5"
        L7_1 = L7_1(L8_1)
        if L7_1 then
          L7_1 = mp
          L7_1 = L7_1.set_mpattribute
          L8_1 = "Lua:PKL_Protocol_V5_suspicious_"
          L9_1 = L2_1
          L8_1 = L8_1 .. L9_1
          L7_1(L8_1)
        end
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
