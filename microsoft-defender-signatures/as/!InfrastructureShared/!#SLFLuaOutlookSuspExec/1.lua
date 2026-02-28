local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4194304 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "Lua:DownFromWebMail"
L3_1 = L3_1(L4_1)
if not L3_1 then
  if L1_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.len
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    if not (L3_1 < 50) then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= nil then
        goto lbl_63
      end
    end
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "\\downloads"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= nil then
      L3_1 = isOutlookProcess
      L3_1 = L3_1()
      if L3_1 then
        goto lbl_63
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_63::
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = ":\\recoverybin\\volume-"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 9) then
    goto lbl_86
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_86::
L4_1 = L2_1
L3_1 = L2_1.sub
L5_1 = -4
L3_1 = L3_1(L4_1, L5_1)
L5_1 = L2_1
L4_1 = L2_1.sub
L6_1 = -3
L4_1 = L4_1(L5_1, L6_1)
L5_1 = {}
L5_1[".jse"] = true
L5_1[".vbs"] = true
L5_1[".wsf"] = true
L5_1[".vbe"] = true
L5_1[".hta"] = true
L5_1[".bat"] = true
L5_1[".ps1"] = true
L5_1[".cmd"] = true
L5_1[".exe"] = true
L5_1[".scr"] = true
L5_1[".pif"] = true
L5_1[".js"] = true
L5_1[".ace"] = true
L5_1[".htm"] = true
L6_1 = L5_1[L3_1]
if L6_1 ~= true then
  L6_1 = L5_1[L4_1]
  if L6_1 ~= true then
    goto lbl_116
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
do return L6_1 end
::lbl_116::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
