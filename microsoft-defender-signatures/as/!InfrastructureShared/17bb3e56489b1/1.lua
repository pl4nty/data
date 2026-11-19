-- Threat: !InfrastructureShared
-- Name: 17bb3e56489b1
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, true, false)
if l_0_1 ~= true then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil and l_0_2.image_path ~= nil and l_0_2.image_path ~= "" then
  local l_0_3 = string.lower(l_0_2.image_path)
  if sysio.IsFileExists(l_0_3) then
    local l_0_4 = mp.IsKnownFriendlyFile(l_0_3, true, false)
    if l_0_4 == true then
      return mp.CLEAN
    end
  end
end

function parsePragmaAlias(l_1_0)
  if l_1_0.matched and l_1_0.utf8p1 ~= nil then
    local l_1_1 = string.lower(l_1_0.utf8p1)
    local l_1_2 = string.match(l_1_1, "([^\\]+)$")
    local l_1_3 = string.match(l_1_1, "(.*)[/\\]")
    return l_1_2, l_1_3
  end
end

local l_0_5 = {}

function addToCleanList(l_2_0)
  local l_2_1, l_2_2 = parsePragmaAlias(l_2_0)
  if l_2_1 == nil then
    return false
  end
  l_0_5[l_2_1] = l_2_2
  return true
end

function countTheMatches(l_3_0, l_3_1)
  local l_3_2 = l_3_1
  local l_3_3, l_3_4 = parsePragmaAlias(l_3_0)
  local l_3_5, l_3_6 = string.gsub(l_3_3, "%.", "")
  if l_3_6 < 2 then
    return l_3_1
  end
  local l_3_7 = string.match(l_3_3, "(.+)%..+$")
  if l_0_5[l_3_7] ~= nil and l_0_5[l_3_7] == l_3_4 then
    l_3_2 = l_3_2 + 1
  end
  return l_3_2
end

if addToCleanList(this_sigattrlog[9]) == false then
  return mp.CLEAN
end
if addToCleanList(this_sigattrlog[10]) == false then
  return mp.CLEAN
end
if addToCleanList(this_sigattrlog[11]) == false then
  return mp.CLEAN
end
if addToCleanList(this_sigattrlog[12]) == false then
  return mp.CLEAN
end
if addToCleanList(this_sigattrlog[13]) == false then
  return mp.CLEAN
end
if addToCleanList(this_sigattrlog[14]) == false then
  return mp.CLEAN
end
local l_0_6 = 0
l_0_6 = countTheMatches(this_sigattrlog[3], l_0_6)
l_0_6 = countTheMatches(this_sigattrlog[4], l_0_6)
l_0_6 = countTheMatches(this_sigattrlog[5], l_0_6)
l_0_6 = countTheMatches(this_sigattrlog[6], l_0_6)
l_0_6 = countTheMatches(this_sigattrlog[7], l_0_6)
l_0_6 = countTheMatches(this_sigattrlog[8], l_0_6)
if 3 <= l_0_6 then
  local l_0_7 = mp.GetParentProcInfo()
  if l_0_7 ~= nil then
    local l_0_8 = string.lower(l_0_7.image_path)
    if sysio.IsFileExists(l_0_8) then
      bm.add_related_file(l_0_8)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
