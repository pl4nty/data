-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\503b38bd26dee\0x00000372_luac 

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
if (this_sigattrlog[21]).matched and (this_sigattrlog[21]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[21]).utf8p1)
else
  if (this_sigattrlog[22]).matched and (this_sigattrlog[22]).utf8p1 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[22]).utf8p1)
  else
    if (this_sigattrlog[23]).matched and (this_sigattrlog[23]).utf8p1 ~= nil then
      l_0_1 = (string.lower)((this_sigattrlog[23]).utf8p1)
    else
      if (this_sigattrlog[24]).matched and (this_sigattrlog[24]).utf8p1 ~= nil then
        l_0_1 = (string.lower)((this_sigattrlog[24]).utf8p1)
      else
        if (this_sigattrlog[25]).matched and (this_sigattrlog[25]).utf8p1 ~= nil then
          l_0_1 = (string.lower)((this_sigattrlog[25]).utf8p1)
        else
          if (this_sigattrlog[26]).matched and (this_sigattrlog[26]).utf8p1 ~= nil then
            l_0_1 = (string.lower)((this_sigattrlog[26]).utf8p1)
          else
            if (this_sigattrlog[27]).matched and (this_sigattrlog[27]).utf8p1 ~= nil then
              l_0_1 = (string.lower)((this_sigattrlog[27]).utf8p1)
            else
              if (this_sigattrlog[28]).matched and (this_sigattrlog[28]).utf8p1 ~= nil then
                l_0_1 = (string.lower)((this_sigattrlog[28]).utf8p1)
              end
            end
          end
        end
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
  -- DECOMPILER ERROR at PC186: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC187: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC188: Overwrote pending register: R5 in 'AssignReg'

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

