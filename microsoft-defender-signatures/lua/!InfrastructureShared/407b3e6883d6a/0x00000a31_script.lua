-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\407b3e6883d6a\0x00000a31_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p2 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[19]).utf8p2)
else
  if (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p2 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[20]).utf8p2)
  end
end
if l_0_1 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1, " /var/tmp/mkinitramfs_", 3, true) or (string.find)(l_0_1, " /var/cache/apt/archives/", 3, true) then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[21]).matched and (this_sigattrlog[21]).utf8p1 ~= nil then
  l_0_2 = (string.lower)((this_sigattrlog[21]).utf8p1)
else
  if (this_sigattrlog[22]).matched and (this_sigattrlog[22]).utf8p1 ~= nil then
    local l_0_3 = (string.lower)((this_sigattrlog[22]).utf8p1)
    l_0_2 = l_0_3:sub(5, #l_0_3)
  end
end
do
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = l_0_2 .. " "
  if (string.find)(l_0_1, l_0_2, 3, true) then
    addRelatedProcess()
    reportRelatedBmHits()
    local l_0_4 = l_0_2 .. "|" .. l_0_1
    ;
    (bm.add_related_string)("file_metadata", l_0_4, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
  do
    return mp.CLEAN
  end
end

