-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e3d73691bd12\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  set_research_data("ParentProcess", (string.gsub)(l_0_0.ppid, ",", ":") .. ";" .. l_0_0.image_path, false)
end
return mp.INFECTED

