-- Threat: !InfrastructureShared
-- Name: !#SuspNewTxtWithGrubCfg
-- Type: 24
-- MpAttributes: BM_TEXT_FILE & BM_ESP_PATH & MpNewlyCreatedHint

local l_0_0 = "MpUefiGrubCheck"
local l_0_1 = "MpUefiGrubCfg"
local l_0_2 = "MpUefiSuspTxt"
if MpCommon.QueryPersistContextNoPath(l_0_0, l_0_1) and MpCommon.QueryPersistContextNoPath(l_0_0, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
