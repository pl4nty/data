-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6b1_2015.luac 

-- params : ...
-- function num : 0
is_in = function(l_1_0, l_1_1)
  -- function num : 0_0
  if (string.match)(l_1_0, l_1_1) ~= nil then
    return true
  else
    return false
  end
end

local l_0_0 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if is_in(l_0_0, "%a:\\program files") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\appdata\\local\\apps\\2%.0\\") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\programs\\onesystem\\spider\\") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\gphdesktopapp\\gphdesktopapp\\globalproductivityhub%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\cubase\\cubase_updater%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\myzone\\software\\myzone2%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\csobpkalk\\csobpkalkulatory%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\nitro pro\\skel\\[%x]+\\nitro_temp_file_cleaner%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\adobe.+\\local\\stubexe\\") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\game\\league of legends%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\win64\\valorant%-win64%-shipping%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\win64\\fortniteclient%-win64%-shipping%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\wegame.+\\dnf%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\screenconnect%.windowsclient%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\robloxplayer") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\win64\\mirmg%-win64%-shipping%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\imagiqsimulator%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\libraries\\dutdriver%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\battle%.net\\battle%.net%.exe") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\steamapps\\") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\world of warcraft\\") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\xboxgames\\") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\heroes of the storm\\") then
  return mp.CLEAN
end
if is_in(l_0_0, "\\dmr auto tuning%.exe") then
  return mp.CLEAN
end
return mp.INFECTED

