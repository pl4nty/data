local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= "" then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
    end
  end
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 ~= nil and L1_1 ~= "" and L0_1 ~= nil then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "/private/tmp/"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= 1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "/Users/Shared/"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= 1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "/tmp/"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= 1 then
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = "/Library/Caches/"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 == nil then
          L3_1 = L1_1
          L2_1 = L1_1.find
          L4_1 = "^/Users/[^/]+/Downloads/[^/]+$"
          L5_1 = 1
          L6_1 = false
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 ~= 1 then
            L2_1 = mp
            L2_1 = L2_1.CLEAN
            return L2_1
          end
        end
      end
    end
  end
  L2_1 = versioning
  L2_1 = L2_1.GetOrgID
  L2_1 = L2_1()
  if L2_1 ~= nil and L2_1 ~= "" then
    L4_1 = L2_1
    L3_1 = L2_1.lower
    L3_1 = L3_1(L4_1)
    if L3_1 == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
