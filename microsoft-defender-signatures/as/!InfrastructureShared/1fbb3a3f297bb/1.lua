local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L2_1 = this_sigattrlog
L2_1 = L2_1[10]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[10]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[11]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[11]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[11]
      L0_1 = L2_1.utf8p2
  end
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "%-[eE][ncodemaNCODEMA]*%s+"
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = NormalizeCmdline
  L3_1 = "powershell"
  L4_1 = L0_1
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
  L2_1 = contains
  L3_1 = L1_1
  L4_1 = "{0}"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L0_1 = L1_1
  end
end
L2_1 = {}
L3_1 = "[CloudMan]"
L4_1 = "/oauth2/v2.0/token"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L0_1
L5_1 = "%'%'%+%'%'"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L0_1 = L3_1
L3_1 = "(?:\\{\\d+\\}(?:\\w+)?(?:\\{\\d+\\})?){3,10}.{1,10}-f"
L4_1 = false
L5_1 = MpCommon
L5_1 = L5_1.StringRegExpSearch
L6_1 = L3_1
L7_1 = L0_1
L5_1, L6_1 = L5_1(L6_1, L7_1)
_ = L6_1
L4_1 = L5_1
if L4_1 == true then
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "PShellEnc_cmdline"
  L7_1 = L0_1
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
