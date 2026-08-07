-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13bb390b724ac\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or not (this_sigattrlog[2]).utf8p1 or not (this_sigattrlog[3]).utf8p1 then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\lsass.exe", 1, true) or (string.find)(l_0_0, "\\services.exe", 1, true) then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
;
(bm.add_related_string)("LSA_SECRETS_PATH", (this_sigattrlog[1]).utf8p1, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1003.004", "SAMDumpingLsaSecrets.MK")
return mp.INFECTED

