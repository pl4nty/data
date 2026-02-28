local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
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
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "\\appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    goto lbl_133
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "/embeddings/oleobject"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = ".bin->(ole stream"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil then
    goto lbl_110
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "->ole stream"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = ")->"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil then
    goto lbl_110
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "->(rtf0"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = ")->"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  ::lbl_110::
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = #L1_1
    L4_1 = L4_1 - 3
    L5_1 = #L1_1
    L5_1 = L5_1 - 3
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 ~= "." then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = #L1_1
      L4_1 = L4_1 - 2
      L5_1 = #L1_1
      L5_1 = L5_1 - 2
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 ~= "." then
        goto lbl_133
      end
    end
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_133::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
