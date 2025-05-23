-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\145b30cab381b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
local l_0_1 = l_0_0:match("\\([^\\]+)$")
local l_0_2 = {}
l_0_2["etrasvc.exe"] = true
if l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(bm.get_current_process_startup_info)
if l_0_3 then
  bm_AddRelatedFileFromCommandLine(l_0_4.command_line, nil, nil, 1)
end
local l_0_5, l_0_6 = nil, nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_5 = (this_sigattrlog[2]).utf8p2
  l_0_6 = (this_sigattrlog[2]).utf8p1 or ""
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    l_0_5 = (this_sigattrlog[3]).utf8p2
    l_0_6 = (this_sigattrlog[3]).utf8p1 or ""
  end
end
if l_0_5 ~= nil and l_0_5 ~= "" then
  local l_0_7 = (string.lower)(l_0_5)
  local l_0_8 = (string.lower)(l_0_6)
  if l_0_7:find("amlsaap", 1, true) or l_0_8:find("amlsaap", 1, true) then
    return mp.CLEAN
  end
  if l_0_7:find("wsauth$") then
    return mp.CLEAN
  end
  if l_0_7:find("tspkg$") then
    return mp.CLEAN
  end
  local l_0_9 = (mp.GetExecutablesFromCommandLine)(l_0_5)
  for l_0_13,l_0_14 in ipairs(l_0_9) do
    l_0_14 = (mp.ContextualExpandEnvironmentVariables)(l_0_14)
    if (sysio.IsFileExists)(l_0_14) then
      (bm.add_threat_file)(l_0_14)
    end
  end
  TrackPidAndTechniqueBM(l_0_4.ppid, "T1547.005", "ssp_tamper")
  return mp.INFECTED
end
do
  return mp.CLEAN
end

