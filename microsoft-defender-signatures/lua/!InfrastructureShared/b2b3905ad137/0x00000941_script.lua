-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b2b3905ad137\0x00000941_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4 = nil, nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  l_0_3 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
local l_0_5 = (mp.GetParentProcInfo)()
if l_0_5 ~= nil and l_0_5.image_path ~= nil then
  l_0_4 = l_0_5.image_path
end
if l_0_3 ~= nil and (string.find)(l_0_3, "var apfell = new agent", 1, true) and (string.find)(l_0_3, "new customc2", 1, true) and (string.find)(l_0_3, "c2.kill_date", 1, true) and (string.find)(l_0_3, "apfell.procinfo.hostname", 1, true) then
  if (sysio.IsFileExists)(l_0_4) then
    (bm.add_threat_file)(l_0_4)
  end
  return mp.INFECTED
end
return mp.CLEAN

