-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17ab39dd76f3e\0x00000b0c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM("BM", "T1040", "CredentialAccess_NetworkSniffing_SuspiciousProcess")
  addRelatedProcess()
  reportRelatedBmHits()
  if not (this_sigattrlog[2]).matched and not (this_sigattrlog[3]).matched and (sysio.IsFileExists)(l_0_0) then
    (bm.add_related_file)(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN

