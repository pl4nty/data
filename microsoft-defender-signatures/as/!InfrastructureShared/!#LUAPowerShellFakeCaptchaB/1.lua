local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = nil
if 2048 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetNormalizedScript
L3_1 = true
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "-replace'"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.match
  L5_1 = "replace%'(.-)%'"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L4_1 = #L3_1
    if L4_1 == 1 then
      L5_1 = L3_1
      L4_1 = L3_1.match
      L6_1 = "[^%w%s]"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L5_1 = L2_1
        L4_1 = L2_1.gsub
        L6_1 = "%"
        L7_1 = L3_1
        L6_1 = L6_1 .. L7_1
        L7_1 = ""
        L4_1 = L4_1(L5_1, L6_1, L7_1)
        L2_1 = L4_1
      end
    end
  end
end
L4_1 = L2_1
L3_1 = L2_1.gsub
L5_1 = "\""
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = "mshta([\\w.\\\"-]+)?http"
L5_1 = L2_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L3_1 == false then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L2_1
L7_1 = "id"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "#"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.HEADERPAGE_SZ
if L0_1 <= L5_1 then
  L5_1 = tostring
  L6_1 = headerpage
  L5_1 = L5_1(L6_1)
  L1_1 = L5_1
else
  L5_1 = mp
  L5_1 = L5_1.readprotection
  L6_1 = false
  L5_1(L6_1)
  L5_1 = tostring
  L6_1 = mp
  L6_1 = L6_1.readfile
  L7_1 = 0
  L8_1 = L0_1
  L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  L1_1 = L5_1
  L5_1 = mp
  L5_1 = L5_1.readprotection
  L6_1 = true
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "\226\156\133"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "\240\159\159\160"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L1_1
    L7_1 = "\240\159\164\150"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_144
    end
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_144::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
