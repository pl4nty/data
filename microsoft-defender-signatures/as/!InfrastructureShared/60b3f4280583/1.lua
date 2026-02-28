local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
    L1_1 = bm
    L1_1 = L1_1.add_related_string
    L2_1 = "AdditionalInfo"
    L3_1 = L0_1
    L4_1 = bm
    L4_1 = L4_1.RelatedStringBMReport
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "BadUrlRep"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = bm
      L1_1 = L1_1.get_imagepath
      L1_1 = L1_1()
      if not L1_1 then
        L1_1 = ""
      end
      L2_1 = {}
      L3_1 = "httpd"
      L4_1 = "w3wp"
      L5_1 = "sqlservr"
      L6_1 = "tomcat"
      L2_1[1] = L3_1
      L2_1[2] = L4_1
      L2_1[3] = L5_1
      L2_1[4] = L6_1
      L3_1 = contains
      L4_1 = L1_1
      L5_1 = L2_1
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
