local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p1
    L1_1 = extract_urls
    L2_1 = L0_1
    L1_1, L2_1 = L1_1(L2_1)
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = L2_1[1]
    L4_1 = isnull
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = split
    L5_1 = L3_1
    L6_1 = "%."
    L4_1 = L4_1(L5_1, L6_1)
    L5_1 = isnull
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = "."
    L6_1 = tostring
    L7_1 = #L4_1
    L7_1 = L4_1[L7_1]
    L6_1 = L6_1(L7_1)
    L5_1 = L5_1 .. L6_1
    L6_1 = isSuspTLD
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = nri
      L6_1 = L6_1.AddTelemetry
      L7_1 = mp
      L7_1 = L7_1.bitor
      L8_1 = mp
      L8_1 = L8_1.bitor
      L9_1 = nri
      L9_1 = L9_1.Telemetry_HOSTNAME
      L10_1 = nri
      L10_1 = L10_1.Telemetry_PATH
      L8_1 = L8_1(L9_1, L10_1)
      L9_1 = nri
      L9_1 = L9_1.Telemetry_QUERY
      L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
      L6_1(L7_1, L8_1, L9_1, L10_1)
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
