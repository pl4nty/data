local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = false
L1_1 = nil
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.command_line
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1.command_line
    L3_1 = L3_1(L4_1)
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "-ap \"msexchange"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L5_1 = L3_1
      L4_1 = L3_1.match
      L6_1 = "-ap \"([^\"]+)\""
      L4_1 = L4_1(L5_1, L6_1)
      L1_1 = L4_1
      if L1_1 ~= nil then
        L0_1 = true
      end
    end
  end
end
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L3_1 = L4_1.utf8p2
end
if L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L5_1 = L4_1
  L4_1 = L4_1.match
  L6_1 = "lua:peoriginalname!(.*)$"
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
end
L4_1 = {}
if L3_1 and L0_1 then
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L4_1
  L7_1 = {}
  L7_1.applicationname = L1_1
  L7_1.modulename = L3_1
  L5_1(L6_1, L7_1)
elseif L3_1 and not L0_1 then
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L4_1
  L7_1 = {}
  L7_1.modulename = L3_1
  L5_1(L6_1, L7_1)
end
L5_1 = #L4_1
if 0 < L5_1 then
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "InMemoryLoadBlocked"
  L7_1 = safeJsonSerialize
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = bm
  L5_1 = L5_1.set_detection_string
  L6_1 = safeJsonSerialize
  L7_1 = L4_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
