-- Threat: !InfrastructureShared
-- Name: 349b37ab7f308
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_1 = string.lower(this_sigattrlog[1].image_path)
  l_0_2 = tonumber(this_sigattrlog[1].ppid)
end
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[9].utf8p1)
end
if l_0_0 and l_0_3 then
  local l_0_4, l_0_5 = pcall(bm.GetModAddress, l_0_2, l_0_3)
  if not l_0_4 or isnull(l_0_5) then
    return mp.CLEAN
  end
  local l_0_6, l_0_7 = pcall(bm.GetProcAddress, l_0_2, l_0_3, "ldrpmrdatabase")
  if not l_0_6 or isnull(l_0_7) then
    return mp.CLEAN
  end
  local l_0_8, l_0_9 = pcall(bm.GetProcAddress, l_0_2, l_0_3, "avrfpapilookupcallbackroutine")
  if not l_0_8 or isnull(l_0_9) then
    return mp.CLEAN
  end
  bm.add_related_string("Sus Image Patch: ", l_0_1, bm.RelatedStringBMReport)
  bm.add_related_string("Sus ntdll Address: ", l_0_5, bm.RelatedStringBMReport)
  bm.add_related_string("Sus LdrpMrdataBase Address: ", l_0_7, bm.RelatedStringBMReport)
  bm.add_related_string("Sus AvrfpAPILookupCallbackRoutine Address: ", l_0_9, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
