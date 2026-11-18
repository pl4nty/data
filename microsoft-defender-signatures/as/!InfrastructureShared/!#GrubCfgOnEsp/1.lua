-- Threat: !InfrastructureShared
-- Name: !#GrubCfgOnEsp
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & BM_ESP_PATH

local l_0_0 = "MpUefiGrubCheck"
local l_0_1 = "MpUefiGrubCfg"
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_2 or #l_0_2 < 8 then
  return mp.CLEAN
end
if l_0_2:sub(-8) == "grub.cfg" then
  MpCommon.AppendPersistContextNoPath(l_0_0, l_0_1, 60)
  return mp.INFECTED
end
return mp.CLEAN
