local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L2_1 = #L0_1
  if not (L2_1 < 40) and L1_1 ~= nil then
    goto lbl_26
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "->"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = string
L3_1 = L3_1.find
L4_1 = L0_1
L5_1 = "newtonsoft.json"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "newtonsoft.json"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    goto lbl_60
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_60::
L3_1 = string
L3_1 = L3_1.find
L4_1 = L0_1
L5_1 = "\\appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L0_1
  L5_1 = "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    goto lbl_153
  end
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "/embeddings/oleobject"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = ".bin->(ole stream"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    goto lbl_132
  end
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "->ole stream"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = ")->"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    goto lbl_132
  end
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "->(rtf0"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = ")->"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  ::lbl_132::
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L1_1
    L5_1 = #L1_1
    L5_1 = L5_1 - 3
    L6_1 = #L1_1
    L6_1 = L6_1 - 3
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 ~= "." then
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L1_1
      L5_1 = #L1_1
      L5_1 = L5_1 - 2
      L6_1 = #L1_1
      L6_1 = L6_1 - 2
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 ~= "." then
        goto lbl_153
      end
    end
    L2_1 = 1
  end
end
::lbl_153::
L3_1 = {}
L3_1.vbs = true
L3_1.vbe = true
L3_1.lnk = true
L3_1.bat = true
L3_1.cmd = true
L3_1.js = true
L3_1.hta = true
L3_1.exe = true
L3_1.wsh = true
L3_1.ps1 = true
L3_1.jse = true
if L2_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L1_1
  L6_1 = #L1_1
  L6_1 = L6_1 - 3
  L7_1 = #L1_1
  L7_1 = L7_1 - 3
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 == "." then
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L1_1
    L6_1 = -3
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L5_1 = L3_1[L4_1]
      if L5_1 == true then
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  else
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L1_1
    L6_1 = #L1_1
    L6_1 = L6_1 - 2
    L7_1 = #L1_1
    L7_1 = L7_1 - 2
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if L4_1 == "." then
      L4_1 = string
      L4_1 = L4_1.sub
      L5_1 = L1_1
      L6_1 = -2
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 ~= nil then
        L5_1 = L3_1[L4_1]
        if L5_1 == true then
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
