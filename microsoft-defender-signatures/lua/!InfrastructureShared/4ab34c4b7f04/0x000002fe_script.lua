-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab34c4b7f04\0x000002fe_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
  l_0_0 = (this_sigattrlog[2]).utf8p1
end
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "BM"
do
  if (string.find)(l_0_1, "/chflags", -8, true) ~= nil then
    local l_0_3 = (mp.GetParentProcInfo)()
    if l_0_3 ~= nil and l_0_3.ppid ~= nil then
      l_0_2 = l_0_3.ppid
    end
  end
  if l_0_2 == "BM" then
    (bm.trigger_sig)("MacChflagsToHidden", l_0_0)
  else
    ;
    (bm.trigger_sig)("MacChflagsToHidden", l_0_0, l_0_2)
  end
  TrackPidAndTechniqueBM(l_0_2, "T1546.001", "DefenseEvasion_HideArtifacts_Chflags")
  return mp.INFECTED
end

