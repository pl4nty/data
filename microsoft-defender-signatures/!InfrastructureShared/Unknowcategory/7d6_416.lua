-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7d6_416.luac 

-- params : ...
-- function num : 0
Infrastructure_ScanCFABootProtState = function()
  -- function num : 0_0
  (MpCommon.SetGlobalMpAttribute)("CFABootProtStateScan")
  ;
  (MpDetection.ScanResource)("regkeyvalue://HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Diagnostics\\\\MpPayloadStatus")
  ;
  (MpCommon.DeleteGlobalMpAttribute)("CFABootProtStateScan")
end


