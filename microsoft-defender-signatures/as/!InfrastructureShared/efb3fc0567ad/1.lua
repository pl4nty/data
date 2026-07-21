-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\efb3fc0567ad\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  local l_0_1 = this_sigattrlog[1]
  local l_0_2 = this_sigattrlog[2]
  if l_0_1 ~= nil and l_0_1.matched and not isnull(l_0_1.utf8p1) then
    l_0_0 = l_0_1.utf8p1
  else
    if l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
      l_0_0 = l_0_2.utf8p1
    end
  end
end
do
  if isnull(l_0_0) then
    return mp.CLEAN
  end
  do
    local l_0_3 = (string.lower)(l_0_0)
    if not (string.find)(l_0_3, "\\sysvol\\", 1, true) or not (string.find)(l_0_3, "\\policies\\", 1, true) then
      return mp.CLEAN
    end
    if not (string.find)(l_0_3, "\\logon\\", 1, true) ~= nil and not (string.find)(l_0_3, "\\startup\\", 1, true) ~= nil then
      return mp.CLEAN
    end
    if (string.sub)(l_0_3, -4) ~= ".exe" then
      return mp.CLEAN
    end
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC121: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (bm.add_related_string)("gpo_sysvol_payload_location", (string.find)(l_0_3, "\\logon\\", 1, true) ~= nil and "Logon" or "Startup", bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("gpo_sysvol_payload_stage", "process_start", bm.RelatedStringBMReport)
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1037.001", "gpo_sysvol_payload_exec", 28800)
    TrackPidAndTechniqueBM("BM", "T1484.001", "gpo_sysvol_payload_exec", 28800)
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end

