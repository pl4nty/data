-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17fb3df0191d9\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
if this_sigattrlog[9] == nil or not (this_sigattrlog[9]).matched then
  return mp.CLEAN
end
do
  local l_0_0 = (this_sigattrlog[9]).utf8p1 or "unknown"
  do
    local l_0_1 = nil
    local l_0_2 = nil
    if isnull((bm.get_imagepath)()) then
      return mp.CLEAN
    end
    local l_0_3 = (this_sigattrlog[9]).utf8p2 or ""
    if (string.find)((string.lower)((bm.get_imagepath)()), "\\windows defender\\", 1, true) then
      return mp.CLEAN
    end
    local l_0_4 = nil
    if (string.find)((string.lower)(l_0_2), "eicar", 1, true) then
      return mp.CLEAN
    end
    if (string.find)((string.lower)(l_0_2), "amsi test", 1, true) then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("WinRMAmsi_detection", l_0_2, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("WinRMAmsi_result", l_0_3, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("WinRMAmsi_process", (string.lower)((bm.get_imagepath)()), bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1059.001", "WinRMAmsiSusp")
    add_parents()
    return mp.INFECTED
  end
end

