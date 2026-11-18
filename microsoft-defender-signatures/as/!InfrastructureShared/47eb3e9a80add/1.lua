-- Threat: !InfrastructureShared
-- Name: 47eb3e9a80add
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[9].utf8p2)
end
if l_0_2 then
  local l_0_3, l_0_4 = pcall(string.match, l_0_2, "vmbaseaddress:(%d+)")
  if not l_0_3 or isnull(l_0_4) then
    return mp.CLEAN
  end
  local l_0_5, l_0_6 = pcall(string.match, l_0_2, "vmbytescopied:(%d+)")
  if not l_0_5 or isnull(l_0_6) then
    return mp.CLEAN
  end
  local l_0_7, l_0_8
  if l_0_0 then
    l_0_7 = l_0_0
    l_0_8 = "32"
  elseif l_0_1 then
    l_0_7 = l_0_1
    l_0_8 = "64"
  end
  if l_0_7 then
    local l_0_9, l_0_10 = pcall(sysio.GetPEVersionInfo, l_0_7)
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
    bm.add_related_string("ARCH: ", l_0_8, bm.RelatedStringBMReport)
  end
  bm.add_related_string("PATCHED BYTES: ", l_0_6, bm.RelatedStringBMReport)
  bm.add_related_string("ETW ABSOLUTE PATCHED ADDRESS: ", l_0_4, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
