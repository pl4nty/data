-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\425b34a35982d\1_luac 

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
if (this_sigattrlog[23]).matched and (this_sigattrlog[23]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[23]).utf8p1)
else
  if (this_sigattrlog[24]).matched and (this_sigattrlog[24]).utf8p1 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[24]).utf8p1)
  end
end
if l_0_1 == nil or #l_0_1 < 2 then
  return mp.CLEAN
end
local l_0_2 = (string.match)(l_0_1, "/%.[^/]+$")
if l_0_2 == nil or #l_0_2 < 4 then
  return mp.CLEAN
end
local l_0_3 = (string.sub)(l_0_2, 3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if l_0_3 == "lockfile" or l_0_3 == "env" or l_0_3 == "git" or l_0_3 == "touch" or l_0_3 == "emacs" then
  return mp.CLEAN
end
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC107: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R6 in 'AssignReg'

  for l_0_8,l_0_9 in ("/bin/")("/usr/bin/") do
    local l_0_10 = l_0_9 .. l_0_3
    if l_0_10 and (sysio.IsFileExists)(l_0_10) then
      addRelatedProcess()
      reportRelatedBmHits()
      TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_MatchLegitimateNameLocation")
      local l_0_11 = l_0_1 .. "|" .. l_0_10
      ;
      (bm.add_related_string)("file_metadata", l_0_11, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

