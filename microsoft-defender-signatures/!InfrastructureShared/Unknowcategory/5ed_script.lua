-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5ed_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = (mp.IsKnownFriendlyFile)(l_0_0, true, false)
if l_0_1 ~= true then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
do
  if l_0_2 ~= nil and l_0_2.image_path ~= nil and l_0_2.image_path ~= "" then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if (sysio.IsFileExists)(l_0_3) and (mp.IsKnownFriendlyFile)(l_0_3, true, false) == true then
      return mp.CLEAN
    end
  end
  parsePragmaAlias = function(l_1_0)
  -- function num : 0_0
  if l_1_0.matched and l_1_0.utf8p1 ~= nil then
    local l_1_1 = (string.lower)(l_1_0.utf8p1)
    local l_1_2 = (string.match)(l_1_1, "([^\\]+)$")
    local l_1_3 = (string.match)(l_1_1, "(.*)[/\\]")
    return l_1_2, l_1_3
  end
end

  local l_0_4 = {}
  addToCleanList = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_4
  local l_2_1, l_2_2 = parsePragmaAlias(l_2_0)
  if l_2_1 == nil then
    return false
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  l_0_4[l_2_1] = l_2_2
  return true
end

  countTheMatches = function(l_3_0, l_3_1)
  -- function num : 0_2 , upvalues : l_0_4
  local l_3_2 = l_3_1
  local l_3_3, l_3_4 = parsePragmaAlias(l_3_0)
  local l_3_5, l_3_6 = (string.gsub)(l_3_3, "%.", "")
  if l_3_6 < 2 then
    return l_3_1
  end
  local l_3_7 = (string.match)(l_3_3, "(.+)%..+$")
  if l_0_4[l_3_7] ~= nil and l_0_4[l_3_7] == l_3_4 then
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
  local l_0_5 = 0
  l_0_5 = countTheMatches(this_sigattrlog[3], l_0_5)
  l_0_5 = countTheMatches(this_sigattrlog[4], l_0_5)
  l_0_5 = countTheMatches(this_sigattrlog[5], l_0_5)
  l_0_5 = countTheMatches(this_sigattrlog[6], l_0_5)
  l_0_5 = countTheMatches(this_sigattrlog[7], l_0_5)
  l_0_5 = countTheMatches(this_sigattrlog[8], l_0_5)
  if l_0_5 >= 3 then
    local l_0_6 = (mp.GetParentProcInfo)()
    do
      do
        if l_0_6 ~= nil then
          local l_0_7 = (string.lower)(l_0_6.image_path)
          if (sysio.IsFileExists)(l_0_7) then
            (bm.add_related_file)(l_0_7)
          end
        end
        do return mp.INFECTED end
        return mp.CLEAN
      end
    end
  end
end

