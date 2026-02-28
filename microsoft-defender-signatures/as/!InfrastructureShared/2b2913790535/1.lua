local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCPT:RotObfusChecked"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
else
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "SCPT:RotObfusChecked"
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
L1_1 = nil
L2_1 = L0_1.is_header
if L2_1 then
  L2_1 = tostring
  L3_1 = headerpage
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
else
  L2_1 = tostring
  L3_1 = footerpage
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "%s+"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = {}
L3_1["wscript.shell"] = true
L3_1["adodb.stream"] = true
L3_1["scripting.filesystemobject"] = true
L4_1 = string
L4_1 = L4_1.gmatch
L5_1 = L2_1
L6_1 = "[Cc][Rr][Ee][Aa][Tt][Ee][Oo][Bb][Jj][Ee][Cc][Tt]%(%w+%([\"'](%w*%.%w*)[\"'],(%d%d?%d?)%)%)"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = tonumber
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L10_1 = nil
  if L9_1 then
    L11_1 = rot_decrypt
    L12_1 = L7_1
    L13_1 = L9_1
    L11_1 = L11_1(L12_1, L13_1)
    L10_1 = L11_1
  else
    L11_1 = rot_decrypt
    L12_1 = L7_1
    L13_1 = 13
    L11_1 = L11_1(L12_1, L13_1)
    L10_1 = L11_1
  end
  if L10_1 then
    L12_1 = L10_1
    L11_1 = L10_1.lower
    L11_1 = L11_1(L12_1)
    L11_1 = L3_1[L11_1]
    if L11_1 then
      L11_1 = mp
      L11_1 = L11_1.set_mpattribute
      L12_1 = "SCPT:RotObfusInfected"
      L11_1(L12_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
