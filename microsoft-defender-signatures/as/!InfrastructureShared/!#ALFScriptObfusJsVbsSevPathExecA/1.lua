local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 300 or 500000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L1_1
L3_1 = L1_1.find
L5_1 = "\\appdata\\local\\temp\\"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "\\appdata\\local\\temp\\(.+)"
  L3_1 = L3_1(L4_1, L5_1)
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
  L4_1 = L4_1(L5_1)
  L5_1 = L4_1
  L4_1 = L4_1.lower
  L4_1 = L4_1(L5_1)
  if L4_1 ~= nil then
    L6_1 = L4_1
    L5_1 = L4_1.match
    L7_1 = "[^\\]+$"
    L5_1 = L5_1(L6_1, L7_1)
    L6_1 = {}
    L6_1["wscript.exe"] = ""
    L6_1["cscript.exe"] = ""
    if L5_1 ~= nil then
      L7_1 = L6_1[L5_1]
      if L7_1 then
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
