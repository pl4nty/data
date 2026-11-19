-- Threat: !InfrastructureShared
-- Name: 412b3e379aac9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[13].utf8p2)
end
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[10].utf8p2)
end
if l_0_2 and l_0_3 then
  local l_0_4, l_0_5 = pcall(string.match, l_0_2, "regionsize:(%d+)")
  if not l_0_4 or isnull(l_0_5) then
    return mp.CLEAN
  end
  local l_0_6, l_0_7
  local l_0_8 = versioning.GetProcessorArchitecture()
  if l_0_8 == 0 then
    l_0_6 = l_0_1
    l_0_7 = "32"
  elseif l_0_8 == 9 then
    if this_sigattrlog[1].matched then
      l_0_6 = l_0_0
      l_0_7 = "32"
    elseif this_sigattrlog[2].matched then
      l_0_6 = l_0_1
      l_0_7 = "64"
    end
  end
  if l_0_6 then
    local l_0_9, l_0_10 = pcall(sysio.GetPEVersionInfo, l_0_6)
    if not l_0_9 or isnull(l_0_10) then
      return mp.CLEAN
    end
    local l_0_11 = l_0_10.OriginalFilename
    local l_0_12 = l_0_10.ProductVersion
    local l_0_13 = l_0_10.FileVersion
    if isnull(l_0_11) or isnull(l_0_12) or isnull(l_0_13) then
      return mp.CLEAN
    end
    bm.add_related_string("PRODUCT VERSION: ", l_0_12, bm.RelatedStringBMReport)
    bm.add_related_string("FILE VERSION: ", l_0_13, bm.RelatedStringBMReport)
    bm.add_related_string("ARCH: ", l_0_7, bm.RelatedStringBMReport)
  end
  bm.add_related_string("PATCHED BYTES: ", l_0_5, bm.RelatedStringBMReport)
  bm.add_related_string("MALCIOUS PATH: ", l_0_3, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
