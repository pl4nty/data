local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.command_line
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_33
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_33::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[3]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L3_1 = L4_1.utf8p2
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.utf8p2
      if L4_1 ~= "" then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[4]
        L3_1 = L4_1.utf8p2
      end
    end
  end
end
if L3_1 ~= nil and L3_1 ~= "" then
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "/private/tmp/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= 1 then
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "/Users/Shared/"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 ~= 1 then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "/tmp/"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 ~= 1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = "/Library/Caches/"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 == nil then
          L5_1 = L3_1
          L4_1 = L3_1.find
          L6_1 = "^/Users/[^/]+/Downloads/[^/]+$"
          L7_1 = 1
          L8_1 = false
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if L4_1 ~= 1 then
            L4_1 = mp
            L4_1 = L4_1.CLEAN
            return L4_1
          end
        end
      end
    end
  end
  L4_1 = IsKeyValuePairInRollingQueue
  L5_1 = "MAC_UNS_ADHOC_PATHS"
  L6_1 = "unsigned_adhoc_items"
  L7_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 then
    L4_1 = versioning
    L4_1 = L4_1.GetOrgID
    L4_1 = L4_1()
    if L4_1 ~= nil and L4_1 ~= "" then
      L6_1 = L4_1
      L5_1 = L4_1.lower
      L5_1 = L5_1(L6_1)
      if L5_1 == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
        L5_1 = sysio
        L5_1 = L5_1.IsFileExists
        L6_1 = L3_1
        L5_1 = L5_1(L6_1)
        if L5_1 then
          L5_1 = bm
          L5_1 = L5_1.add_threat_file
          L6_1 = L3_1
          L5_1(L6_1)
        end
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
