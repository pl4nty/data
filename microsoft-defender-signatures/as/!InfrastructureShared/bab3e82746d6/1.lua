-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bab3e82746d6\1.luac 

-- params : ...
-- function num : 0
if IsLegacyOrgMachine() then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = (bm.get_imagepath)()
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (string.match)(l_0_1, "\\([^\\]+)$")
local l_0_3 = false
if l_0_2 ~= nil and (string.find)(l_0_0, l_0_2, 1, true) then
  l_0_3 = true
end
if l_0_3 == false then
  local l_0_4 = (string.find)(l_0_2, ":", 1, true)
  if l_0_4 ~= nil and l_0_4 >= 0 then
    local l_0_5 = (string.sub)(l_0_2, 1, l_0_4 - 1)
    if l_0_5 ~= nil and (string.find)(l_0_0, l_0_5, 1, true) then
      l_0_3 = true
    end
  end
end
do
  if l_0_3 == true then
    bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 15)
    return mp.INFECTED
  end
  return mp.CLEAN
end

