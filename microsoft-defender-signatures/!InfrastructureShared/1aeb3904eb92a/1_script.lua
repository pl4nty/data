-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1aeb3904eb92a\1_luac 

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
if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[7]).utf8p1)
else
  if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[8]).utf8p1)
  else
    if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
      l_0_1 = (string.lower)((this_sigattrlog[9]).utf8p1)
    else
      if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
        l_0_1 = (string.lower)((this_sigattrlog[10]).utf8p1)
      end
    end
  end
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.match)(l_0_1, "/[^/]+$")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC114: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC115: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("/bin")("/usr/bin") do
    local l_0_9 = l_0_8 .. l_0_2
    if l_0_9 and (sysio.IsFileExists)(l_0_9) then
      addRelatedProcess()
      reportRelatedBmHits()
      TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_MatchLegitimateNameLocation")
      local l_0_10 = l_0_1 .. "|" .. l_0_9
      ;
      (bm.add_related_string)("file_metadata", l_0_10, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

