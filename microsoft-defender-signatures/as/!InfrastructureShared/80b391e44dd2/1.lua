local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "=(https?://.-);"
    L1_1 = L1_1(L2_1, L3_1)
    L0_1 = L1_1
    L1_1 = {}
    L1_1.SIG_CONTEXT = "BM"
    L1_1.CONTENT_SOURCE = "B64decode"
    L1_1.FILELESS = "true"
    L1_1.CMDLINE_URL = "false"
    L2_1 = ExtractUrlGetReputation
    L3_1 = L0_1
    L4_1 = L1_1
    L5_1 = true
    L6_1 = 2
    L7_1 = 60
    L8_1 = false
    L9_1 = 3000
    L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    if L2_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
