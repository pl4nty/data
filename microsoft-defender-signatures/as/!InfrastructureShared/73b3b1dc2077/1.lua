-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3b1dc2077\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
  l_0_0 = (this_sigattrlog[3]).utf8p1
end
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0, "/Users/[^/]+/Library/Group Containers/UBF8T346G9.Office/lck[^/]+", 1, false) then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("%.([^./]+)$")
l_0_1 = (string.lower)(l_0_1)
if l_0_1 == "docx" or l_0_1 == "doc" or l_0_1 == "xlsx" or l_0_1 == "xls" or l_0_1 == "pptx" or l_0_1 == "ppt" or l_0_1 == "json" or l_0_1 == "driveupload" or l_0_1 == "drivedownload" then
  return mp.CLEAN
end
ExtendedSuspMacPathsToMonitor = function(l_1_0)
  -- function num : 0_0
  if SuspMacPathsToMonitor(l_1_0, true) then
    return true
  end
  if l_1_0:find("^/Users/[^/]+/Desktop/", 1, false) or l_1_0:find("^/Users/[^/]+/Documents/", 1, false) or l_1_0:find("^/Users/[^/]+/Downloads/", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+/[^/]+$", 1, false) then
    return true
  end
  return false
end

if not ExtendedSuspMacPathsToMonitor(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = (bm.get_imagepath)()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = "BM"
do
  if (string.find)(l_0_2, "/chflags", -8, true) ~= nil then
    local l_0_4 = (mp.GetParentProcInfo)()
    if l_0_4 ~= nil and l_0_4.ppid ~= nil then
      l_0_3 = l_0_4.ppid
    end
  end
  if l_0_3 == "BM" then
    (bm.trigger_sig)("MacChflagsToHidden", l_0_0)
  else
    ;
    (bm.trigger_sig)("MacChflagsToHidden", l_0_0, l_0_3)
  end
  TrackPidAndTechniqueBM(l_0_3, "T1546.001", "DefenseEvasion_HideArtifacts_Chflags")
  return mp.INFECTED
end

