local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:FnameAttr!_meta.json"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "[\\/]%.openclaw[\\/]"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "[\\/]skills[\\/]"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "\"owner\"%s*:%s*\"(.-)\""
L3_1 = L3_1(L4_1, L5_1)
L2_1.owner = L3_1
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "\"slug\"%s*:%s*\"(.-)\""
L3_1 = L3_1(L4_1, L5_1)
L2_1.slug = L3_1
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "\"displayname\"%s*:%s*\"(.-)\""
L3_1 = L3_1(L4_1, L5_1)
L2_1.displayname = L3_1
L3_1 = next
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.SetDetectionString
  L4_1 = safeJsonSerialize
  L5_1 = L2_1
  L4_1, L5_1 = L4_1(L5_1)
  L3_1(L4_1, L5_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
