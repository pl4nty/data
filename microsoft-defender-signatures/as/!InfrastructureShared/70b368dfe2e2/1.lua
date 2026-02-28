local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p2
    L1_1 = urlDecode
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = "?url=(.*)"
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L0_1
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L0_1
      L5_1 = "(https?://.*)"
      L3_1 = L3_1(L4_1, L5_1)
      L2_1 = L3_1
    end
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = urlDecode
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L2_1
    L5_1 = ".sharepoint.com/:%w:/%w/personal/(.-)/"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L2_1
      L5_1 = ".sharepoint.com/:%w:/%w/sites/(.-)/"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L2_1
        L5_1 = ".sharepoint.com/:%w:/%w/(.-)/"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L3_1 = ""
        end
      end
    end
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p1
    L5_1 = L4_1
    L4_1 = L4_1.match
    L6_1 = "([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = ""
    end
    L5_1 = 1800
    L6_1 = 100
    L7_1 = L4_1
    L8_1 = "->"
    L9_1 = L2_1
    L10_1 = "->"
    L11_1 = L3_1
    L7_1 = L7_1 .. L8_1 .. L9_1 .. L10_1 .. L11_1
    L8_1 = AppendToRollingQueue
    L9_1 = "TEAMS_Download"
    L10_1 = "ClickedLink"
    L11_1 = L7_1
    L12_1 = L5_1
    L13_1 = L6_1
    L14_1 = 0
    L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
