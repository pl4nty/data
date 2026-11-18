-- Threat: !InfrastructureShared
-- Name: e3b381d0bc01
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
elseif this_sigattrlog[7].matched then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
elseif this_sigattrlog[8].matched then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p1)
elseif this_sigattrlog[9].matched then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p1)
end
if l_0_0 ~= nil then
  if l_0_0:find(":\\windows\\", 1, true) or l_0_0:find("\\program file", 1, true) then
    return mp.CLEAN
  end
  if l_0_0:find("\\plugins\\", 1, true) or l_0_0:find("install", 1, true) or l_0_0:find("\\ccm\\", 1, true) or l_0_0:find("\\office\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    local l_0_5 = string.lower(l_0_4.image_path)
    if string.find(l_0_5, "\\wmiprvse.exe", 1, true) or string.find(l_0_5, "\\winrshost.exe", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
